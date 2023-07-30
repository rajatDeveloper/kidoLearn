import 'package:flutter/material.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class TapOn extends StatefulWidget {
  final String operator;
  final String text;
  final Function() onTap;

  const TapOn(
      {
        super.key,
      required this.operator,
      required this.text,
      required this.onTap
      });

  @override
  State<TapOn> createState() => _TapOnState();
}

class _TapOnState extends State<TapOn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      margin: const EdgeInsets.all(10),

      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              widget.text,
              style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              width: getDeviceWidth(context) * 0.3,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryAccent,
              ),
              child: Text(
                widget.operator,
                style: const TextStyle(
                    color: AppColors.light,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
