import 'all_injection.dart';
import 'core/infra/dio_config.dart';

class Initializer {
  static Future<void> init() async {
    final dioConfig = DioConfig.instance();

    await dioConfig.init();
    await initInjections(dioClient: dioConfig.client!);
  }
}
