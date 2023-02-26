import 'dart:async';

import 'package:flutter/material.dart';

import 'core/theme/pokedex_theme.dart';
import 'features/home/presentation/page/home_page.dart';
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
      home: const HomePage(),
    );
  }
}
