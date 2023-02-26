import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/pokedex_theme.dart';

class FatalError extends StatelessWidget {
  const FatalError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Houve um error fatal',
          style: pokeLightTextTheme.bodyText2!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
