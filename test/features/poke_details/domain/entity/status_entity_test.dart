import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/poke_details/domain/entity/status_entity.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final statusJson = fixture("features/poke_details/json/status.json");

  group('Entity of status =>', () {
    group('FromJson of status =>', () {
      test('return object of the status', () {
        final result = StatusEntity.fromJson(statusJson[0]);
        expect(
          result,
          const StatusEntity(
            baseStat: 45,
            effort: 0,
            stat: Stat(
              name: 'hp',
              url: "https://pokeapi.co/api/v2/stat/1/",
            ),
          ),
        );
      });

      test('return object empty of json is null', () {
        final result = StatusEntity.fromJson(null);
        expect(result, const StatusEntity());
      });
    });

    group('ToJson of the staus => ', () {
      test('return json', () {
        final result = const StatusEntity(
          baseStat: 45,
          effort: 0,
          stat: Stat(
            name: 'hp',
            url: "https://pokeapi.co/api/v2/stat/1/",
          ),
        ).toJson();

        expect(result, statusJson[0]);
      });
    });

    group('CopyWith =>', () {
      test('retun equal object', () {
        final status = const StatusEntity(
          baseStat: 45,
          effort: 0,
          stat: Stat(
            name: 'hp',
            url: "https://pokeapi.co/api/v2/stat/1/",
          ),
        );
        final result = status.copyWith(
          baseStat: null,
          effort: null,
          stat: null,
        );

        expect(result, status);
      });

      test('retun different object', () {
        final status = const StatusEntity(
          baseStat: 45,
          effort: 0,
          stat: Stat(
            name: 'hp',
            url: "https://pokeapi.co/api/v2/stat/1/",
          ),
        ).copyWith(
          baseStat: 100,
          effort: 1,
          stat: const Stat(name: 'teste', url: 'urls_exemple'),
        );

        expect(
            status,
            const StatusEntity(
              baseStat: 100,
              effort: 1,
              stat: Stat(name: 'teste', url: 'urls_exemple'),
            ));
      });

      test('retun equal object', () {
        final stat = const Stat(
          name: 'hp',
          url: "https://pokeapi.co/api/v2/stat/1/",
        );
        final result = stat.copyWith(
          name: null,
          url: null,
        );

        expect(result, stat);
      });

      test('retun different object', () {
        final stat = const Stat(
          name: 'hp',
          url: "https://pokeapi.co/api/v2/stat/1/",
        ).copyWith(
          name: 'teste',
          url: 'urls_exemple',
        );

        expect(
          stat,
          const Stat(
            name: 'teste',
            url: 'urls_exemple',
          ),
        );
      });
    });
  });
}
