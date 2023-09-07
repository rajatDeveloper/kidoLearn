import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:kido_learn/module/splash/controller/splash_controller.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/assets.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _controller = SplashController();
  @override
  void initState() {
    super.initState();
    _controller.navigateToMainContent(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.primary.withOpacity(0.7),
              AppColors.primaryAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            // image: DecorationImage(image: AssetImage(imageSplashScreen)),
          ),
          child: SlideInLeft(
            child: Center(
              child: Image.asset(
                imageSplashScreen,
                width: getDeviceWidth(context) * 0.6,
                height: getDeviceHeight(context) * 0.6,
              ),
            ),
          )),
    );
  }
}
