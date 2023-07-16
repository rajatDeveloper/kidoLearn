import 'package:flutter/material.dart';
import 'package:kido_learn/module/Test/screens/test_screen.dart';
import 'package:kido_learn/module/home/screens/select_type_screen.dart';
import 'package:kido_learn/module/slider/screen/slider_screen.dart';
import 'package:kido_learn/module/splash/screen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    SliderScreen.routeName: (context) => const SliderScreen(),
    SelectTabScreen.routeName: (context) => const SelectTabScreen(),
    TestScreen.routeName: (context) {
      final operator =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      String op = operator['op']!;
      String num = operator['num']!;
      return TestScreen(
        operator: op,
        num: num,
      );
    },
  };

  return appRoutes;
}
