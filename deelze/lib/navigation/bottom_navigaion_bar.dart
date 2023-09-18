import 'package:deelze/core/utils/app_colors.dart';
import 'package:deelze/core/utils/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationBarWidget({
    super.key,
    required this.navigationShell,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  void _onTap(index) {
    setState(() {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        selectedItemColor: AppColors.selectedIcon,
        unselectedItemColor: AppColors.unselectedIcon,
        selectedFontSize: UIConstants.selectedFontSize,
        unselectedFontSize: UIConstants.unselectedFontSize,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white, // AppColors.scaffoldColor,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabContainerWidth,
                  height: UIConstants.tabContainerHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.selectedBackgroundTab,
                    borderRadius: BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                  ),
                  child: const Icon(Icons.home),
                ),
              ),
            ),
            activeIcon: Container(
              width: UIConstants.tabSelectedContainerWidth,
              height: UIConstants.tabContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(UIConstants.tabContainerRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabSelectedContainerWidth - 2,
                  height: UIConstants.tabContainerHeight,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 106, 127, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Icon(Icons.home),
                      Spacer(),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontFamily: "Nutrio",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabContainerWidth,
                  height: UIConstants.tabContainerHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.selectedBackgroundTab,
                    borderRadius: BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                  ),
                  child: const Icon(Icons.favorite),
                ),
              ),
            ),
            activeIcon: Container(
              width: 190, // UIConstants.tabSelectedContainerWidth,
              height: UIConstants.tabContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(UIConstants.tabContainerRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabSelectedContainerWidth - 2,
                  height: UIConstants.tabContainerHeight,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 106, 127, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Icon(
                        Icons.favorite,
                        // size: 20,
                      ),
                      Spacer(),
                      Text(
                        "Favorite",
                        style: TextStyle(
                          fontFamily: "Nutrio",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabContainerWidth,
                  height: UIConstants.tabContainerHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.selectedBackgroundTab,
                    borderRadius: BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                  ),
                  child: const Icon(Icons.person),
                ),
              ),
            ),
            activeIcon: Container(
              width: UIConstants.tabSelectedContainerWidth,
              height: UIConstants.tabContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(UIConstants.tabContainerRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabSelectedContainerWidth - 2,
                  height: UIConstants.tabContainerHeight,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 106, 127, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Icon(Icons.person),
                      Spacer(),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontFamily: "Nutrio",
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabContainerWidth,
                  height: UIConstants.tabContainerHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.selectedBackgroundTab,
                    borderRadius: BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/tabbar_logo1.png',
                  ),
                  // child: const Icon(Icons.shopping_cart),
                ),
              ),
            ),
            activeIcon: Container(
              width: UIConstants.tabSelectedContainerWidth,
              height: UIConstants.tabContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(UIConstants.tabContainerRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: UIConstants.tabSelectedContainerWidth - 2,
                  height: UIConstants.tabContainerHeight,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 106, 127, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(UIConstants.tabContainerRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/tabbar_logo.png',
                    ),
                  ),
                ),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
