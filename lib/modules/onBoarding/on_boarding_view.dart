import 'package:evently_flutter/core/extensions/padding_ext.dart';
import 'package:evently_flutter/core/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/core/constants/app_assets.dart';
import '/core/extensions/center_ext.dart';
import '/core/extensions/size_ext.dart';
import '/modules/onBoarding/widget/on_boarding_item.dart';
import '../../core/routes/pages_route_name.dart';
import 'models/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var currentIndex = 0;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 15),
        Image.asset(AppAssets.eventelyLogoSmall, height: 0.07.height)
            .setCenter(),
        Expanded(
          child: PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              currentIndex = index;
              setState(() {});
            },
            itemCount: OnBoardingModel.onBoardingList.length,
            itemBuilder: (BuildContext context, int index) {
              return OnBoardingItem(
                  onBoardingModel: OnBoardingModel.onBoardingList[index]);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: currentIndex == 0 ? 0 : 1,
              child: IconButton.outlined(
                icon: Image.asset(
                  AppAssets.arrowBack,
                  height: 15,
                ),
                color: ColorPalette.primaryColor,
                style: IconButton.styleFrom(
                    side: BorderSide(color: ColorPalette.primaryColor)),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
              ).setHorizontalPadding(context, 0.015),
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: OnBoardingModel.onBoardingList.length,
              effect: ExpandingDotsEffect(
                activeDotColor: ColorPalette.primaryColor,
                dotColor: Color(0xFF1C1C1C),
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            IconButton.outlined(
              icon: Image.asset(
                AppAssets.arrowForward,
                height: 15,
              ),
              color: ColorPalette.primaryColor,
              style: IconButton.styleFrom(
                  side: BorderSide(color: ColorPalette.primaryColor)),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                currentIndex == OnBoardingModel.onBoardingList.length - 1
                    ? Navigator.pushNamedAndRemoveUntil(
                        context, PagesRouteName.signIn, (route) => false)
                    : controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                ;
              },
            ).setHorizontalPadding(context, 0.015),
          ],
        ),
        SizedBox(height: 15)
      ]),
    ));
  }
}
