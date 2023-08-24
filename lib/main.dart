import 'package:flutter/material.dart';
import 'package:prutteka_flutter/app/util/dependency.dart';
import 'package:prutteka_flutter/presentation/initialized_app.dart';

void main() {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InitializedApp());
}
