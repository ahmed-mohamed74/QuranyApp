import 'package:flutter/material.dart';

import '../../app_sizes.dart';
import '../../app_strings.dart';
import '../AppColors/app_colors.light.dart';

ThemeData getAppLightTheme() => ThemeData(
      scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
      primaryColor: AppColorsLight.primaryColors,

      appBarTheme: const AppBarTheme(
        color: AppColorsLight.appBarColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColorsLight.iconColor,
        size: 24,
      ),
      dividerColor: AppColorsLight.dividerColor,
      fontFamily: AppStrings.fontFamily,
      //! text
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          // of app bar
          color: AppColorsLight.leadingAppBarColor,
          fontSize: AppSizes.appBarLeadingSize,
        ),
        headlineLarge: TextStyle(
          fontSize: AppSizes.bodyTextSize,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        //categories
        headlineMedium: TextStyle(
          fontSize: AppSizes.bodyTextSize,
          color: Colors.black,
        ),
      ),
    );
