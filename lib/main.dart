import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

import 'core/errors/pages/fatal_error.dart';
import 'core/theme/pokedex_theme.dart';
import 'initializer.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Initializer.init();
    runApp(const RunApp());
  }, (e, s) {
    debugPrint("<====== ERROR AO INICIAR APP =====> ");
    debugPrint("- E R R O R: $e");
    debugPrint("- S T A C K: $s");
  });
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: PokedexTheme.light,
      darkTheme: PokedexTheme.dark,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      navigatorKey: NavKey.navKey,
      builder: (context, widget) {
        Widget screen = const FatalError();
        if (widget is Scaffold || widget is Navigator) screen = widget!;
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => screen;
        return screen;
      },
    );
  }
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();

  static BuildContext? get globalContext => navKey.currentContext;
}
