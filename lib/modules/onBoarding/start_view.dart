import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';
import '/core/extensions/center_ext.dart';
import '/core/extensions/padding_ext.dart';
import '/core/extensions/size_ext.dart';
import '/core/services/local_storage_keys.dart';
import '/core/services/local_storage_services.dart';
import '../../core/routes/pages_route_name.dart';
import '../../core/theme/color_palette.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Image.asset(AppAssets.eventelyLogoSmall, height: 0.07.height)
                  .setCenter(),
              Image.asset(
                isDark ? AppAssets.startImageDark : AppAssets.startImageLight,
                height: 0.45.height,
              ).setVerticalPadding(context, 0.015),
              Text(
                "Personalize Your Experience",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ).setVerticalPadding(context, 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  AnimatedToggleSwitch<String>.rolling(
                    current: "en",
                    values: ["en", "ar"],
                    height: 35,
                    indicatorSize: Size(35, 35),
                    iconList: [
                      Image.asset(
                        AppAssets.englishIcon,
                        height: 30,
                      ),
                      Image.asset(
                        AppAssets.arabicIcon,
                        height: 30,
                      )
                    ],
                    onChanged: (value) {},
                    style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        indicatorColor: ColorPalette.primaryColor,
                        borderColor: ColorPalette.primaryColor),
                  )
                ],
              ).setVerticalPadding(context, 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  AnimatedToggleSwitch<ThemeMode>.rolling(
                    current: ThemeMode.light,
                    values: [ThemeMode.light, ThemeMode.dark],
                    height: 35,
                    indicatorSize: Size(35, 35),
                    iconList: [
                      Image.asset(
                        AppAssets.lightThemeIcon,
                        height: 25,
                      ),
                      Image.asset(
                        AppAssets.darkThemeIcon,
                        height: 25,
                        color: isDark ? Colors.white : null,
                      )
                    ],
                    onChanged: (value) {},
                    style: ToggleStyle(
                      backgroundColor: Colors.transparent,
                      indicatorColor: ColorPalette.primaryColor,
                      borderColor: ColorPalette.primaryColor,
                    ),
                  )
                ],
              ).setVerticalPadding(context, 0.01),
              ElevatedButton(
                      onPressed: () {
                        LocalStorageServices.setBool(
                            LocalStorageKeys.isFirstTimeRun, false);
                        Navigator.pushNamedAndRemoveUntil(context,
                            PagesRouteName.onBoarding, (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.primaryColor,
                          elevation: 0,
                          padding: 14.vPadding,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text("Let’s Start",
                          style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.white,
                              fontSize: 20,
                              fontFamily: "Inter")))
                  .setVerticalPadding(context, 0.03),
            ],
          ).setHorizontalPadding(context, 0.02),
        ),
      ),
    );
  }
}
