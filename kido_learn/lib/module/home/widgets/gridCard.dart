import 'package:flutter/material.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class GridCard extends StatefulWidget {
  final String operator;
  final String text;
  final Function() onTap;

  const GridCard(
      {super.key,
      required this.operator,
      required this.text,
      required this.onTap});

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: getDeviceWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.darkGrey,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: getDeviceWidth(context) * 0.15,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryAccent,
              ),
              child: Text(
                widget.operator,
                style: TextStyle(
                    color: AppColors.light,
                    fontSize: getFontSize(28, getDeviceWidth(context)),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.bold,
                fontSize: getFontSize(16, getDeviceWidth(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
