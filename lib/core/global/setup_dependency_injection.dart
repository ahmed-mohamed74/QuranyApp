import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/Home/Presentation/view_models/Cubits/Localization/localization_cubit.dart';
import '../../../Features/Home/Presentation/view_models/Cubits/Theme/theme_cubit.dart';
import '../../Features/Azkari/Presentation/view_models/Cubits/Add_Zekr_Cubit/edafet_zekr_cubit.dart';
import '../../Features/Azkari/Presentation/view_models/Cubits/Edit_Zekr_Cubit/edit_zekr_cubit_cubit.dart';
import '../../Features/Azkari/Presentation/view_models/Cubits/Hsn_muslim_cubit/azkari_cubit.dart';
import '../../Features/Azkari/data/Repository/azkari_repo_implementation.dart';
import '../../Features/Azkari/data/local_json_services.dart';
import '../Api/dio_web_services.dart';
import '../Database/cach_helper.dart';
import '../Database/hive_services.dart';

final getIt = GetIt.instance;

void setUpDependencyInjection() {
  // the object of this class called only when we trigger this object in our app
  // not when this function called setUpDependencyInjection() called before running the app
  //and dont be intialliazed another object any more again too
  getIt.registerSingleton(
    HiveServices(),
  ); //! recheck this later
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(),
  );
  getIt.registerLazySingleton<LocalizationCubit>(
    () => LocalizationCubit(),
  );
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(),
  );
  getIt.registerLazySingleton<DioWebServices>(
    () => DioWebServices(
      Dio(),
    ),
  );
  getIt.registerLazySingleton<LocalJsonDataServices>(
    () => LocalJsonDataServices(),
  );
  getIt.registerLazySingleton<AzkariRepostoryImplementation>(
    () => AzkariRepostoryImplementation(
      localJsonData: getIt<LocalJsonDataServices>(),
    ),
  );
  getIt.registerLazySingleton<AzkariCubit>(
    () => AzkariCubit(
      getIt<AzkariRepostoryImplementation>(),
    ),
  );
  getIt.registerLazySingleton<EdafetZekrCubit>(
    () => EdafetZekrCubit(),
  );

  getIt.registerLazySingleton<EditZekrCubitCubit>(
    () => EditZekrCubitCubit(),
  );
}
