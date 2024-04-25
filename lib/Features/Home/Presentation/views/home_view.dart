import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      // final lang =
      //     context.read<LocalizationCubit>().getTheLatestLanguageChoice();

      // BlocProvider.of<LocalizationCubit>(context)
      //     .detectAndChangeAppLanguage(language: Locale(lang));
      // final appCurrentTheme =
      //     context.read<ThemeCubit>().getTheLatestThemeChoice();
      // BlocProvider.of<ThemeCubit>(context)
      //     .detectAndChangeAppTheme(currentTheme: appCurrentTheme);
      // LocalNotificationServices.getInstance().showSimpleMessage(
      //   id: 1,
      //   title: 'hi',
      //   notificationDetails: const NotificationDetails(
      //     android: AndroidNotificationDetails('1', 'lnn'),
      //   ),
      //   body: '3amaltha ?',
      // );
      //     SettingPageRepoImplementation settingPageRepoImplementation =
      //         SettingPageRepoImplementation();
      //     await settingPageRepoImplementation.azkarBeforeSleeping();
      //   },
      // ),
    );
  }
}
