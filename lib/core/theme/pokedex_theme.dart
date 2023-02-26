import 'package:flutter/material.dart';

class PokedexTheme {
  static final light = ThemeData(
    primarySwatch: const MaterialColor(
      0xFFC5484C,
      <int, Color>{
        50: Color(0xFFFFEBEE),
        100: Color(0xFFFFCDD2),
        200: Color(0xFFEF9A9A),
        300: Color(0xFFE57373),
        400: Color(0xFFEF5350),
        500: Color(0xFFC5484C),
        600: Color(0xFFE53935),
        700: Color(0xFFD32F2F),
        800: Color(0xFFC62828),
        900: Color(0xFFB71C1C),
      },
    ),
    backgroundColor: Colors.grey,
    scaffoldBackgroundColor: Colors.blueGrey,
    textTheme: pokeLightTextTheme,
  );

  static final dark = ThemeData(
    primarySwatch: Colors.blueGrey,
    backgroundColor: Colors.grey.shade900,
    scaffoldBackgroundColor: Colors.grey.shade900,
    textTheme: pokeDarkTextTheme,
  );
}

const TextTheme pokeLightTextTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 64.0,
    fontWeight: FontWeight.w200,
    letterSpacing: -1.5,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  headline2: TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w200,
    letterSpacing: -0.5,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  headline3: TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  headline4: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  headline5: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  headline6: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  subtitle1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  subtitle2: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  bodyText1: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  bodyText2: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  button: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    fontFamilyFallback: ['Roboto-bold'],
    color: Colors.black,
  ),
  caption: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
  overline: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    fontFamilyFallback: ['Roboto'],
    color: Colors.black,
  ),
);

const TextTheme pokeDarkTextTheme = TextTheme(
  headline1: TextStyle(
      fontSize: 64.0,
      fontWeight: FontWeight.w200,
      letterSpacing: -1.5,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  headline2: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w200,
      letterSpacing: -0.5,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  headline3: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  headline4: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  headline5: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  headline6: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  subtitle2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  bodyText1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  button: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
      fontFamilyFallback: ['Roboto-bold'],
      color: Colors.white),
  caption: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
  overline: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      fontFamilyFallback: ['Roboto'],
      color: Colors.white),
);
