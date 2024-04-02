import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/Database/cach_helper.dart';
import '../../../../../../core/global/app_strings.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  //! late ?
  late Locale appLanguage;

  void detectAndChangeAppLanguage(
      {Locale? language = const Locale(AppStrings.arabicLang),}) {
    if (language!.languageCode == AppStrings.arabicLang) {
      appLanguage = const Locale(AppStrings.englishLang);
    } else {
      appLanguage = const Locale(AppStrings.arabicLang);
    }
    emit(
      EmitAppLanguageChangeState(
        languageCode: appLanguage.languageCode, // ar
      ),
    );

    storeTheLatestSelectedAppLanguage();
    // store in sharedPrefrences
  }

  //! handle it by dependency Inj later
  void storeTheLatestSelectedAppLanguage() {
    CacheHelper().saveData(
      key: AppStrings.languagekey,
      value: appLanguage.languageCode,
    );
  }

  String getTheLatestLanguageChoice() {
    return CacheHelper().getDataString(
          key: AppStrings.languagekey,
        ) ??
        AppStrings.arabicLang;
    // if its the user first time to open app
  }
}
