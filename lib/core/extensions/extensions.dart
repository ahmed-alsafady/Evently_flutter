import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//This extension allows you to add padding to any widget with a single method call.
extension PaddingExtension on Widget {
  Widget withCustomPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}

//This extension allows you to easily control the visibility of a widget.
extension VisibilityExtension on Widget {
  Widget withVisibility(bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: this,
    );
  }
}

//This extension can be used to easily add a background color to any widget.
extension BackgroundColorExtension on Widget {
  Widget withBackgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }
}

//This extension adds a shadow to any widget.
extension ShadowExtension on Widget {
  Widget withShadow({double blurRadius = 10.0, Color color = Colors.black}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
          ),
        ],
      ),
      child: this,
    );
  }
}

//A simple extension to convert a string to a Text widget with default style.
extension StringExtension on String {
  Text toText({TextStyle? style}) {
    return Text(
      this,
      style: style ?? TextStyle(fontSize: 18.0),
    );
  }
}

//A quick extension to add a rounded corner to any widget.
extension BorderRadiusExtension on Widget {
  Widget withBorderRadius(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }
}

//This extension simplifies converting a list of widgets into a GridView.
extension GridViewExtension on List<Widget> {
  Widget toGridView(
      {int crossAxisCount = 2,
      double crossAxisSpacing = 4.0,
      double mainAxisSpacing = 4.0}) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: length,
      itemBuilder: (context, index) => this[index],
    );
  }
}

//This extension allows you to add spacing between widgets in a column or row.
extension SpacingExtension on List<Widget> {
  Widget withSpacing(double space) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(height: space),
          this[i],
        ]
      ],
    );
  }
}

//This extension allows you to easily customize TextStyle for any widget with a Text widget.
extension TextStyleExtension on String {
  Text styledText({
    Color color = Colors.black,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Text(
      this,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

//This extension simplifies creating a LinearGradient for a widget background.
extension GradientExtension on Widget {
  Widget withGradient(List<Color> colors,
      [Alignment begin = Alignment.topLeft,
      Alignment end = Alignment.bottomRight]) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: begin,
          end: end,
        ),
      ),
      child: this,
    );
  }
}

//This extension helps you format a DateTime object to a string in a specified format.
extension DateTimeExtension on DateTime {
  String toFormattedString({String format = 'yyyy-MM-dd HH:mm:ss'}) {
    return DateFormat(format).format(this);
  }
}

//If you're using custom transitions with navigation, this extension simplifies pushing routes with transitions.
//context.pushPage(MyNewScreen());
extension NavigationExtension on BuildContext {
  Future<T?> pushPage<T>(Widget page) {
    return Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}

//This extension adds borders to widgets in a concise way.
extension BorderExtension on Widget {
  Widget withBorder({
    double width = 1.0,
    Color color = Colors.black,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: width,
        ),
      ),
      child: this,
    );
  }
}

//This extension wraps any widget with Expanded, making it take all available space in a Row or Column.
extension FullScreenExtension on Widget {
  Widget fullScreen() {
    return Expanded(
      child: this,
    );
  }
}

//Here's a more general-purpose extension that can convert a String into a Text widget with common styling and a Container wrapper.
extension TextHelperExtension on String {
  Widget toTextWidget({
    Color color = Colors.black,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) {
    return Container(
      padding: padding,
      child: Text(
        this,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
