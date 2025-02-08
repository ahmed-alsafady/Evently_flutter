import 'package:flutter/material.dart';

import '/core/extensions/padding_ext.dart';
import '/core/extensions/size_ext.dart';
import '/core/theme/color_palette.dart';
import '/modules/onBoarding/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;

  const OnBoardingItem({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          onBoardingModel.imagePath,
          height: 0.45.height,
        ),
        Text(
          onBoardingModel.title,
          textAlign: TextAlign.start,
          style: theme.textTheme.titleMedium?.copyWith(
            color: ColorPalette.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ).setHorizontalPadding(context, 0.04),
        Text(
          onBoardingModel.desc ?? "",
          textAlign: TextAlign.start,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ).setOnlyPadding(context, top: 0.01, left: 0.04),
      ],
    );
  }
}
