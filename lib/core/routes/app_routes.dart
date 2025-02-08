import 'package:evently_flutter/modules/onBoarding/start_view.dart';
import 'package:flutter/material.dart';

import '/core/routes/pages_route_name.dart';
import '/modules/forgetPassword/forget_password_view.dart';
import '/modules/onBoarding/on_boarding_view.dart';
import '/modules/signIn/sign_in_view.dart';
import '/modules/signUp/sign_up_view.dart';
import '/modules/splash/splash_view.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PagesRouteName.startView:
        return MaterialPageRoute(
          builder: (context) => StartView(),
          settings: settings,
        );
      case PagesRouteName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => OnBoardingView(),
          settings: settings,
        );
      case PagesRouteName.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInView(),
          settings: settings,
        );
      case PagesRouteName.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case PagesRouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
    }
  }
}
