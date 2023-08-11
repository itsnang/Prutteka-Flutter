import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/pages/home_page.dart';

class InitializedApp extends StatelessWidget {
  const InitializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prutteka',
      home: HomePage(),
    );
  }
}
