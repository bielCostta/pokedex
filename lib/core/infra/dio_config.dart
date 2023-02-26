import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show debugPrint;

class DioConfig {
  DioConfig.instance();

  Dio? _client;
  Dio? get client => _client;

  Future<void> init() async {
    _client ??= Dio()
      ..options = BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 8000,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
        validateStatus: (status) => status == 200,
      )
      ..interceptors.add(_interceptor);
  }

  InterceptorsWrapper get _interceptor => InterceptorsWrapper(
        onRequest: (options, handler) async {
          debugPrint('===> ${options.method.toUpperCase()}: ${options.path}');
          handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (error, handler) {
          debugPrint(
              '\n############        INTERCEPTOR ERROR    ################\n'
              'URl = ${error.requestOptions.path}\n'
              'MESSAGE = ${error.message}\n'
              'TYPE = ${error.type}\n'
              '###########################################################');

          throw error;
        },
      );
}
