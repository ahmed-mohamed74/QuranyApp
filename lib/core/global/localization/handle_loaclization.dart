// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../app_strings.dart';
import 'generated/l10n.dart';

class LocalizationHandler {
  static bool isArabic() {
    return Intl.getCurrentLocale() == AppStrings.arabicLang;
  }

  //! assign for localeResolutionCallback attribute in material app

  // languge of user mobile ,  supportedLocales => list of supported langues

  static Locale? determineDefaultPhoneSystemLanguage(locale, supportedLocales) {
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode) {
        return supportedLocale;
      }
    }

    return const Locale(AppStrings.arabicLang);
  }

  //! assign for localizationsDelegates attribute in material app

  static List<LocalizationsDelegate<dynamic>> get handleLocalizationDelegates {
    return const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}
