import 'package:flutter/material.dart';

import 'widget/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingViewBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final lang =
      //         context.read<LocalizationCubit>().getTheLatestLanguageChoice();

      //     BlocProvider.of<LocalizationCubit>(context)
      //         .detectAndChangeAppLanguage(language: Locale(lang));

      //     final appCurrentTheme =
      //         context.read<ThemeCubit>().getTheLatestThemeChoice();

      //     BlocProvider.of<ThemeCubit>(context)
      //         .detectAndChangeAppTheme(currentTheme: appCurrentTheme);
      //   },
      // ),
    );
  }
}
