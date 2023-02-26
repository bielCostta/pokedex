import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/home/home_injection.dart';
import 'features/poke_details/details_injection.dart';

final di = GetIt.instance;

Future<void> initInjections({required Dio dioClient}) async {
  di.registerSingleton<Dio>(dioClient);

  await initHomeDependencies();
  await initDetailsDependencies();
}
