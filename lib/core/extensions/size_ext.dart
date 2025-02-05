import 'package:evently_flutter/main.dart';
import 'package:flutter/material.dart';

extension Responsive on double {
  double get height =>
      MediaQuery.of(navigatorKey.currentContext!).size.height * this;

  double get width =>
      MediaQuery.of(navigatorKey.currentContext!).size.width * this;
}
