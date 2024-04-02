import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/Database/cach_helper.dart';
import '../../../../../../core/global/app_strings.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  late String newTheme;
  void detectAndChangeAppTheme({String? currentTheme}) {
    if (currentTheme == AppStrings.appLighttheme) {
      newTheme = AppStrings.appDarktheme;
    } else {
      newTheme = AppStrings.appLighttheme;
    }
    emit(
      EmitThemeToggledState(
        newTheme: newTheme,
      ),
    );
    storeTheLatestSelectedAppTheme();
    // store in sharedPrefrences
  }

  //! handle it by dependency Inj later
  void storeTheLatestSelectedAppTheme() {
    CacheHelper().saveData(
      key: AppStrings.themekey,
      value: newTheme,
    );
  }

  String getTheLatestThemeChoice() {
    return CacheHelper().getDataString(
          key: AppStrings.themekey,
        ) ??
        AppStrings.appLighttheme; //* if its the user first time to open app
  }
}
