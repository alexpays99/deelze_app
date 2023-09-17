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
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.scaffoldColor,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: const SizedBox(
              width: UIConstants.tabContainerWidth,
              height: UIConstants.tabContainerHeight,
              child: Icon(Icons.home_outlined),
            ),
            activeIcon: Container(
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
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: const SizedBox(
              width: UIConstants.tabContainerWidth,
              height: UIConstants.tabContainerHeight,
              child: Icon(Icons.favorite_outline),
            ),
            activeIcon: Container(
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
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: const SizedBox(
              width: UIConstants.tabContainerWidth,
              height: UIConstants.tabContainerHeight,
              child: Icon(Icons.add),
            ),
            activeIcon: Container(
              width: UIConstants.tabContainerWidth,
              height: UIConstants.tabContainerHeight,
              decoration: const BoxDecoration(
                color: AppColors.selectedBackgroundTab,
                borderRadius: BorderRadius.all(
                  Radius.circular(UIConstants.tabContainerRadius),
                ),
              ),
              child: const Icon(Icons.add_circle_rounded),
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: const SizedBox(
              width: UIConstants.tabContainerWidth,
              height: UIConstants.tabContainerHeight,
              child: Icon(Icons.shopping_cart_outlined),
            ),
            activeIcon: Container(
              width: UIConstants.tabContainerWidth,
              height: UIConstants.tabContainerHeight,
              decoration: const BoxDecoration(
                color: AppColors.selectedBackgroundTab,
                borderRadius: BorderRadius.all(
                  Radius.circular(UIConstants.tabContainerRadius),
                ),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            label: "Deelze",
          ),
        ],
      ),
    );
  }
}
