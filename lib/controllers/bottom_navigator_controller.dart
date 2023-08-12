import 'package:get/get.dart';

class BottomNavConroller extends GetxController {
  int bottomNavIndex = 0;
  void onBottomNavTap(int index) {
    bottomNavIndex = index;
    update();
  }
}
