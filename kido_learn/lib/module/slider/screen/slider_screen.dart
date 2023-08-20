import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kido_learn/module/home/screens/select_type_screen.dart';
import 'package:kido_learn/module/slider/controller/slider_controller.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/assets.dart';
import 'package:kido_learn/utils/helping_functions.dart';
import 'package:kido_learn/utils/text.dart';

class SliderScreen extends StatelessWidget {
  static const String routeName = "/slider-screen";
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SliderController controller = SliderController();
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: getDeviceWidth(context),
            child: CarouselSlider(
              items: controller.sliderItems,
              options: CarouselOptions(
                autoPlay: true, // Set to true for automatic sliding
                enlargeCenterPage:
                    true, // Set to true to enlarge the center item
                aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                // You can customize various options here
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                slideText1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.light,
                    fontSize: getFontSize(17, getDeviceWidth(context)),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, SelectTabScreen.routeName);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Play Now",
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.light,
                      size: 15,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
