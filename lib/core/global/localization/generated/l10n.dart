// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `الرئيسيه`
  String get mainScreentitle {
    return Intl.message(
      'الرئيسيه',
      name: 'mainScreentitle',
      desc: '',
      args: [],
    );
  }

  /// `دليلك`
  String get dalelkPageTitle {
    return Intl.message(
      'دليلك',
      name: 'dalelkPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `السبحه`
  String get sebhaPageTitle {
    return Intl.message(
      'السبحه',
      name: 'sebhaPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `الاذكار`
  String get azkaryPageTitle {
    return Intl.message(
      'الاذكار',
      name: 'azkaryPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `لا تنسي أذكارك`
  String get subtitle {
    return Intl.message(
      'لا تنسي أذكارك',
      name: 'subtitle',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get navBar1 {
    return Intl.message(
      'الرئيسية',
      name: 'navBar1',
      desc: '',
      args: [],
    );
  }

  /// `الاذكار`
  String get navBar2 {
    return Intl.message(
      'الاذكار',
      name: 'navBar2',
      desc: '',
      args: [],
    );
  }

  /// `السبحة`
  String get navBar3 {
    return Intl.message(
      'السبحة',
      name: 'navBar3',
      desc: '',
      args: [],
    );
  }

  /// `دليلك`
  String get navBar4 {
    return Intl.message(
      'دليلك',
      name: 'navBar4',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادت`
  String get navBar5 {
    return Intl.message(
      'الإعدادت',
      name: 'navBar5',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادت`
  String get settingTitle {
    return Intl.message(
      'الإعدادت',
      name: 'settingTitle',
      desc: '',
      args: [],
    );
  }

  /// `المظهر`
  String get settingTitle1 {
    return Intl.message(
      'المظهر',
      name: 'settingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `الاشعارات الصوتيه`
  String get notificationSectiontitle {
    return Intl.message(
      'الاشعارات الصوتيه',
      name: 'notificationSectiontitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
