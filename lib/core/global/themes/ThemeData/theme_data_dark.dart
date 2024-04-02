import 'package:flutter/material.dart';

import '../../app_sizes.dart';
import '../../app_strings.dart';
import '../AppColors/app_colors_dark.dart';

ThemeData getAppDarkTheme() => ThemeData(
      scaffoldBackgroundColor: AppColorsDark.scaffoldBackgroundColor,
      primaryColor: AppColorsDark.primaryColor,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(
          AppColorsDark.switchOffColor,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColorsDark.buttonColor,
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            AppColorsDark.iconButtonColor,
          ),
        ),
      ),
      //!
      primaryColorDark: AppColorsDark.primaryColorDark,
      iconTheme: const IconThemeData(
        color: AppColorsDark.iconColor,
        size: AppSizes.appIconsSize,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColorsDark.appBarColor,
        titleTextStyle: TextStyle(
          //! to change later
          color: Colors.white,
          fontSize: AppSizes.appBarLeadingSize,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      fontFamily: AppStrings.fontFamily,
      dividerColor: AppColorsDark.dividerColor,

      //! text
      indicatorColor: AppColorsDark.indicatorColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: AppSizes.appBarLeadingSize,
          color: Colors.white,
        ),
        //navigation bar
        headlineLarge: TextStyle(
          fontSize: AppSizes.bodyTextSize,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        //categories
        headlineMedium: TextStyle(
          fontSize: AppSizes.bodyTextSize,
          color: Colors.white,
        ),
        //subtitle text
        bodyMedium: TextStyle(
          fontSize: 23,
          color: Colors.grey,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        //! text field themes
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.greenAccent,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColorsDark.textFieldFocusedBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColorsDark.textFieldEnabledBorderColor,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColorsDark.textFieldErrorBorderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColorsDark.textFieldErrorBorderColor,
          ),
        ),
      ),
    );
