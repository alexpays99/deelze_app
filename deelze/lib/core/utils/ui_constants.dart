import 'package:deelze/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UIConstants {
  static const double ingredientBorderWidth = 1.0;
  static const double ingredientBoxSize = 60.0;
  static const double ingredientIconSize = 30.0;
  static const double refreshIconSize = 32.0;
  static const double textStrokeWidth = 2.0;
  static const double letterSpacing = 2.0;

  static const double ingredientsListPadding = 20.0;
  static const double recipesListPadding = 16.0;
  static const double recipeWidgetPadding = 10.0;
  static const double detailsPadding = 20.0;

  static const double smallPadding = 6.0;
  static const double mediumPadding = 12.0;
  static const double largePadding = 24.0;

  static const double logoWidth = 175.0;

  static const double imageBorderRadius = 5.0;
  static const double imageHeight = 200.0;

  static const double recipeBorderRadius = 10.0;
  static const double dietsBorderRadius = 10.0;

  static const double maxCrossAxisExtent = 120.0;
  static const double childAspectRatio = 1.0;
  static const double crossAxisSpacing = 20.0;
  static const double mainAxisSpacing = 30.0;

  static const double buttonHeight = 58.0;
  static const double recipeButtonHeight = 80.0;
  static const double buttonPadding = 15.0;
  static const double buttonTextFontSize = 20.0;
  static const double buttonBorderRadius = 5.0;

  static const double textSize = 16.0;
  static const double recipeTextSize = 20.0;

  static const double recipeTitleSize = 30.0;
  static const double recipeSubtitleSize = 25.0;
  static const double titleSize = 26.0;
  static const double subtitleSize = 22.0;
  static const double appBarTitleFontSize = 20.0;

  static const double dietTitleTextSize = 30.0;

  static const double selectedFontSize = 12.0;
  static const double unselectedFontSize = 12.0;

  // My Recipes constants
  static const double myRecipesAppBarPadding = 20.0;
  static const double myRecipesListPadding = 20.0;
  static const double savedRecipeInfoPadding = 22.0;

  static const double addToFavouriteIconSize = 30.0;
  static const double deleteIconSize = 30.0;

  static const double tabContainerRadius = 50.0;

  static const double tabContainerWidth = 64.0;
  static const double tabContainerHeight = 32.0;

  // Nutritional supplements constants
  static const double nutritionalSupplementsItemHeight = 65;

  static const double nutritionalSupplementsItemHorisontalPadding = 24;
  static const double nutritionalSupplementsItemVerticalPadding = 8;

  static const TextStyle navigationTextStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: textSize,
  );
  static const TextStyle appBarTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: appBarTitleFontSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: buttonTextFontSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: textSize,
    fontFamily: "Nunito",
  );
  static const TextStyle subtitleStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: recipeSubtitleSize,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle recipeTextStyle = TextStyle(
    color: AppColors.subtitleColor,
    fontSize: recipeTextSize,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle recipeTitleStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: recipeTitleSize,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle recipeSubtitleStyle = TextStyle(
    letterSpacing: letterSpacing,
    color: AppColors.textColor,
    fontSize: titleSize,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle titleStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: titleSize,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle recipeTextStrokeStyle = TextStyle(
    fontSize: recipeTextSize,
    fontWeight: FontWeight.bold,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = textStrokeWidth
      ..color = AppColors.textStrokeColor,
  );
  static final TextStyle recipeSubtitleStrokeStyle = TextStyle(
    letterSpacing: letterSpacing,
    fontSize: titleSize,
    fontWeight: FontWeight.w600,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = textStrokeWidth
      ..color = AppColors.textStrokeColor,
  );

  static final TextStyle dietTextStrokeStyle = TextStyle(
    fontSize: dietTitleTextSize,
    fontWeight: FontWeight.bold,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = textStrokeWidth
      ..color = AppColors.textStrokeColor,
  );
}
