import 'package:flutter/material.dart';
import 'package:kido_learn/utils/appColor.dart';

class CardForSlider extends StatelessWidget {
  final String img;

  const CardForSlider({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.darkGrey,
      ),
      child: Image.asset(
        img,
      ),
    );
  }
}
