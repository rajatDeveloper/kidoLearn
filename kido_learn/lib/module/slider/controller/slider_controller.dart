import 'package:flutter/material.dart';
import 'package:kido_learn/module/slider/widgets/cardForSlider.dart';
import 'package:kido_learn/utils/assets.dart';

class SliderController {
  List<Widget> sliderItems = [
    const CardForSlider(img: slide1),
    const CardForSlider(img: slide2),
    const CardForSlider(img: slide3)
  ];
}
