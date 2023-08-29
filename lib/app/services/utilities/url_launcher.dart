// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:prutteka_flutter/app/shared/themes/color_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  UrlUtil._();

  static void launchUrl(String url) {
    canLaunch(url).then((value) {
      launch(url);
    }).catchError((onError) {
      log('cannot launch error: $onError');
      Fluttertoast.showToast(
        msg: 'Something went wrongs',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorTheme.backgroundDark,
        textColor: ColorTheme.white,
      );
    });
  }
}
