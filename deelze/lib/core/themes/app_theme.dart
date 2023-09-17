import 'package:deelze/core/utils/app_colors.dart';
import 'package:deelze/core/utils/ui_constants.dart';
import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.appBarColor,
    centerTitle: true,
    titleTextStyle: UIConstants.appBarTextStyle,
  ),
  textTheme: const TextTheme(
    // Default text
    bodySmall: UIConstants.textStyle,
    // Recipe text
    // bodyMedium: UIConstants.recipeTextStyle,
    // Recipe title
    bodyLarge: UIConstants.recipeTitleStyle,
    // Recipe subtitle
    labelSmall: UIConstants.recipeSubtitleStyle,
    // Default Title
    labelMedium: UIConstants.titleStyle,
    // Default subtitle
    labelLarge: UIConstants.subtitleStyle,
    // Navigation text style
    titleSmall: UIConstants.navigationTextStyle,
    // TextField style
    titleMedium: UIConstants.textStyle,
    // Button text style
    titleLarge: UIConstants.buttonTextStyle,
  ),
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.scaffoldColor,
      textStyle: UIConstants.buttonTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIConstants.buttonBorderRadius),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    focusColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.buttonBorderRadius),
    ),

    // focusedBorder: const OutlineInputBorder(
    //   borderSide: BorderSide(color: AppColors.secondaryColor),
    //   borderRadius: BorderRadius.all(
    //     Radius.circular(UIConstants.buttonBorderRadius),
    //   ),
    // ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.errorColor),
      borderRadius: BorderRadius.all(
        Radius.circular(UIConstants.buttonBorderRadius),
      ),
    ),
    helperStyle: const TextStyle(
      color: AppColors.errorColor,
    ),
    helperMaxLines: 3,
  ),
  buttonTheme: const ButtonThemeData(
    height: 33,
    minWidth: 220,
    buttonColor: Color.fromRGBO(7, 106, 127, 100),
  ),
);
