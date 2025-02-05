import 'package:flutter/material.dart';

extension PaddingExtension on num {
  /// Returns EdgeInsets with vertical padding
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble());

  /// Returns EdgeInsets with horizontal padding
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble());

  /// Returns EdgeInsets with all sides padding
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
}

extension PaddingExt on Widget {
  /// Adds only specific padding
  Widget setOnlyPadding(BuildContext context,
      {double top = 0.0,
      double bottom = 0.0,
      double left = 0.0,
      double right = 0.0,
      bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: enableMediaQuery ? mediaQuery.size.height * top : top,
        bottom: enableMediaQuery ? mediaQuery.size.height * bottom : bottom,
        left: enableMediaQuery ? mediaQuery.size.width * left : left,
        right: enableMediaQuery ? mediaQuery.size.width * right : right,
      ),
      child: this,
    );
  }

  /// Adds vertical padding
  Widget setVerticalPadding(BuildContext context, double vertical,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:
            enableMediaQuery ? mediaQuery.size.height * vertical : vertical,
      ),
      child: this,
    );
  }

  /// Adds horizontal padding
  Widget setHorizontalPadding(BuildContext context, double horizontal,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            enableMediaQuery ? mediaQuery.size.width * horizontal : horizontal,
      ),
      child: this,
    );
  }
}
