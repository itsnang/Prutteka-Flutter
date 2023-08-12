import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/controllers/bottom_navigator_controller.dart';

import 'package:prutteka_flutter/shared/themes/color_theme.dart';

class BottomNavigatorWidget extends StatelessWidget {
  BottomNavigatorWidget({super.key, this.onTap});
  Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    BottomNavConroller bottomNavCtr = Get.put(BottomNavConroller());
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorTheme.grey900,
      selectedItemColor: ColorTheme.primaryColor,
      currentIndex: bottomNavCtr.bottomNavIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.magnifyingGlass),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.star),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.userCircle),
          label: 'User',
        ),
      ],
    );
  }
}
