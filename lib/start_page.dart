import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/controllers/bottom_navigator_controller.dart';
import 'package:prutteka_flutter/pages/favorites/favorite_page.dart';
import 'package:prutteka_flutter/pages/home_page.dart';
import 'package:prutteka_flutter/pages/search/search_page.dart';
import 'package:prutteka_flutter/pages/user/user_page.dart';
import 'package:prutteka_flutter/shared/widgets/bottom_navigator_widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();

  static const List<Widget> _widgetOption = <Widget>[
    HomePage(),
    SearchPage(),
    FavoritePage(),
    UserPage()
  ];
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    BottomNavConroller bottomNavCtr = Get.put(BottomNavConroller());
    return GetBuilder<BottomNavConroller>(
      initState: (_) {},
      builder: (builder) {
        return Scaffold(
          bottomNavigationBar: BottomNavigatorWidget(
            onTap: (index) => bottomNavCtr.onBottomNavTap(index),
          ),
          body: StartPage._widgetOption.elementAt(bottomNavCtr.bottomNavIndex),
        );
      },
    );
  }
}
