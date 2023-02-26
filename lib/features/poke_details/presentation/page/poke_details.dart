import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/theme/poke_measures.dart';
import 'package:pokedex/features/poke_details/presentation/bloc/details_bloc.dart';

import '../../../../all_injection.dart';
import '../../../../core/infra/poke_url.dart';

part '../widgets/status_item_widget.dart';

enum StatusType { hp, attack, defense, specialAttack, specialDefense, speed }

class PokeDetails extends StatefulWidget {
  const PokeDetails({
    super.key,
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  State<PokeDetails> createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  final bloc = di<DetailsBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchDetailsEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        title: Text(
          'Detalhes',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: BlocBuilder(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current is DetailsLoading ||
            current is DetailsEmpty ||
            current is DetailsLoaded,
        builder: (context, state) {
          switch (state.runtimeType) {
            case DetailsLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case DetailsEmpty:
              return const Center(
                child: Text(
                  'Não conseguimos encontrar nenhum dado sobre este pokemon',
                ),
              );

            case DetailsLoaded:
              final details = (state as DetailsLoaded).status;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: PokeMeasures.base,
                          right: PokeMeasures.base,
                        ),
                        child: Text(
                          'ID: ${widget.id}',
                          textAlign: TextAlign.right,
                          style: _theme.textTheme.headline6!.copyWith(
                            color: _theme.primaryColor,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: SvgPicture.network(
                          '${PokeURL.baseImageURL}${widget.id}.svg',
                          alignment: Alignment.center,
                          placeholderBuilder: (context) => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: PokeMeasures.base),
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: _theme.textTheme.headline6!.copyWith(
                          color: _theme.primaryColor,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Divider(
                      height: 16.0,
                      thickness: 1.0,
                      indent: PokeMeasures.base * 2,
                      endIndent: PokeMeasures.base * 2,
                      color: _theme.primaryColor,
                    ),
                    ...StatusType.values
                        .map(
                          (element) => _StatusItemWidget(
                            name: details[element.index].stat?.name ?? '##',
                            statusValue: details[element.index].baseStat ?? 0,
                            statusColor: _statusColor(element),
                          ),
                        )
                        .toList(),
                  ],
                ),
              );

            default:
              return const Text('Houve um error');
          }
        },
      ),
    );
  }

  ThemeData get _theme => Theme.of(context);
}

Color _statusColor(StatusType status) {
  switch (status) {
    case StatusType.hp:
      return Colors.green;
    case StatusType.attack:
      return Colors.red;
    case StatusType.defense:
      return Colors.cyan;
    case StatusType.specialAttack:
      return Colors.purple;
    case StatusType.specialDefense:
      return Colors.teal;
    case StatusType.speed:
      return Colors.yellow;

    default:
      return Colors.red;
  }
}
