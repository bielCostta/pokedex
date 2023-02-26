import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  const PokemonEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Pokemons>? results;

  PokemonEntity copyWith({
    int? count,
    String? next,
    String? previous,
    List<Pokemons>? results,
  }) =>
      PokemonEntity(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory PokemonEntity.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const PokemonEntity();

    return PokemonEntity(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<Pokemons>.from(
        json['results'].map(
          (element) => Pokemons.fromJson(element),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results != null
            ? List<dynamic>.from(
                results!.map(
                  (element) => element.toJson(),
                ),
              )
            : null,
      };

  @override
  List<Object?> get props => [count, next, previous, results];
}

class Pokemons extends Equatable {
  const Pokemons({
    this.id,
    this.name,
    this.url,
  });

  final int? id;
  final String? name;
  final String? url;

  Pokemons copyWith({
    int? id,
    String? name,
    String? url,
  }) =>
      Pokemons(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Pokemons.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const Pokemons();
    final url = (json['url'] as String);
    final splits = url.split('/');
    return Pokemons(
      id: int.tryParse(splits[splits.length - 2]),
      name: json['name'],
      url: url,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
      };

  @override
  List<Object?> get props => [id ?? '', name, url ?? ''];
}
