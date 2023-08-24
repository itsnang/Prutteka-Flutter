import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/presentation/controllers/bottom_navigator_controller.dart';
import 'package:prutteka_flutter/presentation/pages/favorites/favorite_page.dart';
import 'package:prutteka_flutter/presentation/pages/home/home_page.dart';
import 'package:prutteka_flutter/presentation/pages/search/search_page.dart';
import 'package:prutteka_flutter/presentation/pages/splash_screen.dart';
import 'package:prutteka_flutter/presentation/pages/user/user_page.dart';
import 'package:prutteka_flutter/app/shared/widgets/bottom_navigator_widget.dart';

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

  static final bindings = [null, null, null, null];
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    // BottomNavConroller bottomNavCtr = Get.put(BottomNavConroller());

    final Future<String> timer =
        Future<String>.delayed(const Duration(seconds: 2), () => "");

    return FutureBuilder<String>(
      future: timer,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget child;
        if (!snapshot.hasData) {
          child = const SplashScreen(key: ValueKey(0));
        } else if (snapshot.hasError) {
          child = const Text("Something went wrong");
        } else {
          child = GetBuilder<BottomNavConroller>(
            key: const ValueKey(1),
            init: BottomNavConroller(),
            // initState: (_) {},
            builder: (builder) {
              final binding =
                  StartPage.bindings.elementAt(builder.bottomNavIndex);
              if (binding != null) binding.dependencies();
              return Scaffold(
                bottomNavigationBar: BottomNavigatorWidget(
                  onTap: (index) => builder.onBottomNavTap(index),
                ),
                body: StartPage._widgetOption.elementAt(builder.bottomNavIndex),
              );
            },
          );
        }

        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: child,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            });
      },
    );
  }
}
