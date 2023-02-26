import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/theme/poke_measures.dart';

import '../../../../all_injection.dart';
import '../bloc/home_bloc.dart';
import '../widgets/card_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = di<HomeBloc>();
  final listController = ScrollController();
  bool isLoadingList = false;

  @override
  void initState() {
    super.initState();
    bloc.add(FetchPokemons());

    listController.addListener(() {
      final max = listController.position.maxScrollExtent;
      final offsetPercent = listController.offset / max * 100;

      if (offsetPercent >= 80 && !isLoadingList) {
        bloc.add(NextPokemons());
        isLoadingList = true;
      }
    });
  }

  @override
  void dispose() {
    bloc.close();
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'POKEDEX',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder(
        bloc: bloc,
        buildWhen: (previus, current) =>
            current is HomeLoaded || current is HomeLoading,
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoaded:
              isLoadingList = false;
              final pokemons = (state as HomeLoaded).pokemons;
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: PokeMeasures.base),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PokeMeasures.base,
                      ),
                      child: Material(
                        color: Colors.black.withOpacity(.26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            PokeMeasures.base * 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: PokeMeasures.base,
                                    horizontal: PokeMeasures.base * 2.0,
                                  ),
                                  child: Text(
                                    'POKEMONS',
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: PokeMeasures.base,
                                    horizontal: PokeMeasures.base * 2.0,
                                  ),
                                  child: Text(
                                    'CUSTOM POKEMONS',
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () async {
                        bloc.add(FetchPokemons());
                        await Future.delayed(const Duration(seconds: 2));
                      },
                      child: Scrollbar(
                        radius: const Radius.circular(PokeMeasures.base * 2.0),
                        thickness: 6.0,
                        controller: listController,
                        child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: listController,
                          padding: const EdgeInsets.all(PokeMeasures.base),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width / 2.0,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: PokeMeasures.base,
                            mainAxisSpacing: PokeMeasures.base,
                          ),
                          itemCount: pokemons.length,
                          itemBuilder: (context, index) {
                            return CardPokemon(
                              name: '${pokemons[index].name}',
                              id: pokemons[index].id ?? 0,
                            );
                          },
                          addRepaintBoundaries: true,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              );

            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
          }
        },
      ),
    );
  }
}
