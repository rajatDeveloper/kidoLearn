import 'package:flutter/material.dart';
import 'package:kido_learn/module/slider/screen/slider_screen.dart';

class SplashController {
  void navigateToMainContent({
    required BuildContext context,
  }) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, SliderScreen.routeName);
  }
}
