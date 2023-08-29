import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:prutteka_flutter/app/shared/themes/theme.dart';
import 'package:prutteka_flutter/app/shared/widgets/text_widget.dart';

class BaseScaffoldWidget extends StatelessWidget {
  BaseScaffoldWidget({
    super.key,
    this.title,
    required this.icon,
    required this.body,
    this.onBackPressed,
  });

  String? title;
  final HeroIcons icon;
  final Widget body;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: context.backgroundColor,
          title: TextWidget.title(title ?? ''),
          leading: arrowBackButton(context)),
      body: body,
    );
  }

  IconButton arrowBackButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onBackPressed == null) {
          Get.back();
        } else {
          onBackPressed?.call();
        }
      },
      icon: HeroIcon(
        icon,
        color: context.primaryColor,
      ),
    );
  }
}
