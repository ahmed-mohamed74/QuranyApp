import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Features/Home/Presentation/view_models/Cubits/Localization/localization_cubit.dart';
import 'Features/Home/Presentation/view_models/Cubits/Theme/theme_cubit.dart';
import 'Features/Radio/Cubit/cubit/radio_cubit_cubit.dart';
import 'Features/Settings/data/notification_services.dart';
import 'app_router.dart';
import 'core/Database/cach_helper.dart';
import 'core/global/SharedWidgets/bottom_nav_bar_widget.dart';
import 'core/global/app_strings.dart';
import 'core/global/localization/generated/l10n.dart';
import 'core/global/localization/handle_loaclization.dart';
import 'core/global/setup_dependency_injection.dart';
import 'core/global/themes/ThemeData/theme_data_dark.dart';
import 'core/global/themes/ThemeData/theme_data_light.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  await LocalNotificationServices.init();
  setUpDependencyInjection();

  // FlutterNativeSplash.preserve(

  //   //! re comment it again later

  //   widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),

  // );

  debugInvertOversizedImages = false;

  await getIt<CacheHelper>().init();

  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const RotatedCircle(),
    ),
  );
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          final String appLanguage =
              LocalizationCubit().getTheLatestLanguageChoice();

          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final String appTheme = ThemeCubit().getTheLatestThemeChoice();

              return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  // ignore: deprecated_member_use
                  useInheritedMediaQuery: true,
                  // locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  //! checking for important of these attributes

                  // checkerboardRasterCacheImages: true,

                  // checkerboardOffscreenLayers: true,

                  themeAnimationStyle: AnimationStyle(
                    curve: Curves.easeInOutQuart,
                    duration: const Duration(
                      seconds: 0,
                    ),
                  ),

                  locale: Locale(
                    appLanguage, //TODO: to support other langaugage pass => appLanguage
                  ),

                  localeResolutionCallback:
                      LocalizationHandler.determineDefaultPhoneSystemLanguage,

                  localizationsDelegates:
                      LocalizationHandler.handleLocalizationDelegates,

                  supportedLocales: S.delegate.supportedLocales,

                  title: AppStrings.appTitle,

                  theme: (appTheme == AppStrings.appLighttheme)
                      ? getAppDarkTheme()
                      : getAppLightTheme(),

                  onGenerateRoute: AppRouter.onGenerateRoutes,

                  home: const CustomBottomNavBar(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
