import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prutteka_flutter/presentation/controllers/event/event_binding.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/presentation/start_page.dart';

class InitializedApp extends StatelessWidget {
  const InitializedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: EventBinding(),
      title: 'Prutteka',
      theme: PtTheme.lightTheme,
      home: const StartPage(),
    );
  }
}
