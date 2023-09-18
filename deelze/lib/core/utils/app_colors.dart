import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color errorColor = Color(0xFFFF5555);

  static const Color scaffoldColor =
      Color(0xFF24282F); //Color.fromARGB(255, 255, 255, 255);
  static const Color bottomNavBarColor = Color(0xFF24282F);

  static const Color appBarColor = Color(0xFF24282F);
  static const Color secondaryColor = Color(0xFFABDAE1);
  static const Color sliverAppBarColor = Colors.black;

  static const Color selectedBorderColor = Colors.white;
  static const Color unselectedBorderColor = Colors.white24;
  static const Color selectedRecipeColor = Colors.red;
  static const Color unselectedRecipeColor = Colors.white24;

  static const Color textFieldColor = Color(0xFF3C3E44);

  static const Color textColor = Colors.white;
  static const Color titleColor = Colors.white;
  static const Color subtitleColor = Colors.white70;
  static const Color noConnectionButtonColor = Colors.blue;
  static const Color deleteAccountDeleteColor = Colors.red;
  static const Color deleteAccountCancelButtonColor = Colors.blue;
  static const Color textStrokeColor = Colors.black;

  static final Color opacityWhite = Colors.white.withOpacity(0.1);

  static const Color transparent = Colors.transparent;
  static const Color seeMore = Colors.blue;
  static const Color seeLess = Colors.blue;

  // BottomNavigationBar colors
  static const Color selectedBackgroundTab = Color.fromRGBO(239, 239, 239, 100);
  static const Color selectedIcon = Color(0xFFFFFFFF);
  static const Color unselectedIcon = Color.fromARGB(255, 243, 149, 8);

  static final List<Color> recipeColors = [
    Colors.black.withOpacity(0.4),
    Colors.transparent,
    Colors.black.withOpacity(0.7),
  ];

  static final List<Color> firstRecipeColors = [
    Colors.green,
    Colors.green.withOpacity(0.6),
    Colors.transparent,
  ];
  static final List<Color> secondRecipeColors = [
    Colors.blue,
    Colors.blue.withOpacity(0.6),
    Colors.transparent,
  ];
  static final List<Color> thirdRecipeColors = [
    Colors.red,
    Colors.red.withOpacity(0.6),
    Colors.transparent,
  ];

  static final List<Color> nutritionalSupplementsColors = [
    Color.fromARGB(255, 127, 238, 131),
    Colors.white,
    Colors.amber,
    Colors.orangeAccent,
    Color.fromARGB(255, 234, 74, 74),
    Color.fromARGB(255, 167, 74, 234),
    Color.fromRGBO(103, 74, 234, 1),
    Color.fromARGB(255, 74, 194, 234),
    Color.fromARGB(255, 74, 234, 210),
    Color.fromARGB(255, 74, 234, 127),
    Color.fromARGB(255, 170, 234, 74),
    Color.fromARGB(255, 234, 223, 74),
    Color.fromARGB(255, 234, 114, 74),
    Color.fromARGB(255, 232, 170, 255),
  ];

  // Account colors
  static const Color popupIconColor = Colors.white;
}
