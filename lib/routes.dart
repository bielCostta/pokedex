import 'package:flutter/material.dart';
import 'package:pokedex/core/errors/pages/fatal_error.dart';
import 'package:pokedex/features/home/presentation/page/home_page.dart';

import 'features/poke_details/presentation/page/poke_details.dart';
import 'main.dart';

abstract class Routes {
  static const initial = '/';
  static const pokeDetails = '/details';

  static Widget routeFromName(
    String route, {
    var arguments,
  }) {
    try {
      switch (route) {
        case initial:
          return const HomePage();

        case pokeDetails:
          return PokeDetails(
            id: arguments['id'],
            name: arguments['name'],
          );

        default:
          return const Text("Atenção! defina uma rota");
      }
    } catch (e) {
      debugPrint('Error ao acessar rota --> $e');
      return const FatalError();
    }
  }

  static Route generateRoute(RouteSettings settings) {
    final route = routeFromName(settings.name!, arguments: settings.arguments);
    return MaterialPageRoute(settings: settings, builder: (context) => route);
  }

  static Future push(String route, {Map<String, dynamic>? arguments}) async {
    return await NavKey.navKey.currentState!.pushNamed(
      route,
      arguments: arguments,
    );
  }

  static void pop({dynamic value}) {
    return NavKey.navKey.currentState!.pop(value);
  }

  static Future pushAndRemoveUntil(
    String route, {
    String? routeToRetain,
    Map<String, dynamic>? arguments,
  }) async {
    return await NavKey.navKey.currentState!.pushNamedAndRemoveUntil(
      route,
      routeToRetain is String
          ? ModalRoute.withName(routeToRetain)
          : (route) => false,
      arguments: arguments,
    );
  }

  static Future maybePop({dynamic result}) {
    return NavKey.navKey.currentState!.maybePop(result);
  }

  static void popUntil(String route) {
    return NavKey.navKey.currentState!.popUntil(ModalRoute.withName(route));
  }
}
