import 'package:flutter/material.dart';

void printError(var e, StackTrace s) {
  debugPrint("====== error in app =======");
  debugPrint("=> Erro: $e");
  debugPrint("=> StackTrace: $s");
}
