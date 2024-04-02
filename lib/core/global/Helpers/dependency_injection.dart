import 'package:get_it/get_it.dart';

import '../../../Features/Home/Presentation/view_models/Cubits/Localization/localization_cubit.dart';
import '../../../Features/Home/Presentation/view_models/Cubits/Theme/theme_cubit.dart';
import '../../Database/cach_helper.dart';

final getIt = GetIt.instance;

void setUpDependencyInjection() {
  // the object of this class called only when we trigger this object in our app
  // not when this function called setUpDependencyInjection() called before running the app
  //and dont be intialliazed another object any more again too
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
