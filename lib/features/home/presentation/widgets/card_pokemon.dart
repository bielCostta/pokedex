import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/infra/poke_url.dart';
import 'package:pokedex/core/theme/poke_measures.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon({
    super.key,
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          PokeMeasures.borderRadius * 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.network(
            '${PokeURL.baseImageURL}${widget.id}.svg',
            placeholderBuilder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            height: 150,
            width: 100,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(top: PokeMeasures.base),
            child: Text(
              widget.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
