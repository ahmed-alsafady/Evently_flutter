import 'dart:async';

import 'package:evently_flutter/core/routes/pages_route_name.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, PagesRouteName.signIn, (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.eventelyLogo, height: size.height * 0.25)
        ],
      ),
    );
  }
}
