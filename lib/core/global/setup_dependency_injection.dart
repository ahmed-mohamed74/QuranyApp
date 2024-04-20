import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../Api/dio_web_services.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<DioWebServices>(
    () => DioWebServices(Dio()),
  );

  // getIt.registerSingleton<AppModel>(AppModel());
}
// *After that you can access your AppModel class from anywhere like this:
// getIt<AppModel>().update
