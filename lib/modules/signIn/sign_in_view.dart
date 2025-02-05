import 'package:evently_flutter/core/extensions/padding_ext.dart';
import 'package:evently_flutter/core/extensions/size_ext.dart';
import 'package:evently_flutter/core/theme/color_palette.dart';
import 'package:evently_flutter/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(AppAssets.eventelyLogo, height: 0.25.height),
                CustomTextField(
                  hint: "Email",
                  hintColor: ColorPalette.generalGrayColor,
                  prefixIcon: ImageIcon(
                    AssetImage(AppAssets.emailIcon),
                    color: ColorPalette.generalGrayColor,
                  ),
                ).setOnlyPadding(context, top: 0.03, bottom: 0.02),
                CustomTextField(
                    hint: 'Password',
                    hintColor: ColorPalette.generalGrayColor,
                    isPassword: true,
                    prefixIcon: ImageIcon(
                      AssetImage(AppAssets.passwordIcon),
                      color: ColorPalette.generalGrayColor,
                    )).setOnlyPadding(context, top: 0.01, bottom: 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password ?",
                        style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorPalette.primaryColor),
                      )),
                ).setVerticalPadding(context, 0.01),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.primaryColor,
                        elevation: 0,
                        padding: 4.vPadding,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text("Login",
                        style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.white,
                            fontSize: 20,
                            fontFamily: "Inter"))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t Have Account?",
                      style: theme.textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: () {},
                        style: theme.textButtonTheme.style,
                        child: Text("Create New Account",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorPalette.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorPalette.primaryColor,
                            ))),
                  ],
                ).setVerticalPadding(context, 0.01),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: ColorPalette.primaryColor,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    )),
                    Text(
                      "Or",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: ColorPalette.primaryColor,
                      thickness: 1,
                      endIndent: 10,
                      indent: 10,
                    ))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        overlayColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        // Removes shadow
                        backgroundColor: ColorPalette.appWhiteColor,
                        elevation: 0,
                        padding: 4.vPadding,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                BorderSide(color: ColorPalette.primaryColor))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.googleIcon,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Login With Google",
                              style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: ColorPalette.primaryColor,
                                  fontSize: 18,
                                  fontFamily: "Inter")),
                        ])).setVerticalPadding(context, 0.01),
              ],
            ).setHorizontalPadding(context, 0.01),
          ),
        ),
      ),
    );
  }
}
