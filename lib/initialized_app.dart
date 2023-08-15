import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/shared/themes/theme.dart';
import 'package:prutteka_flutter/start_page.dart';

class InitializedApp extends StatelessWidget {
  const InitializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prutteka',
      theme: PtTheme.lightTheme,
      home: const StartPage(),
    );
  }
}
