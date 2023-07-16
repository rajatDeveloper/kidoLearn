import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_learn/logic/random_number.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class BlockData extends StatefulWidget {
  final String operator;

  const BlockData({super.key, required this.operator});
  @override
  State<BlockData> createState() => _BlockDataState();
}

class _BlockDataState extends State<BlockData> {
  List<int>? data;
  int? a;
  int? b;
  int? result;
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = generateRandomTwoNumbers(10, 80);
    a = data![0];
    b = data![1];
    if (widget.operator == "+") {
      result = a! + b!;
    } else if (widget.operator == "-") {
      result = a! - b!;
    } else if (widget.operator == "×") {
      result = a! * b!;
    } else if (widget.operator == "÷") {
      double doubleData = a! / b!;
      result = doubleData.toInt();
    }
    log(a.toString() +
        " " +
        b.toString() +
        " " +
        result.toString() +
        "Random numbers");
  }

  @override
  Widget build(BuildContext context) {
    return result != null
        ? Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.all(10),
            width: getDeviceWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.darkGrey,
                  ),
                  child: Text(
                    a.toString(),
                    style: TextStyle(
                        color: AppColors.light,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  widget.operator,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: getFontSize(30, getDeviceWidth(context)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.darkGrey,
                  ),
                  child: Text(
                    b.toString(),
                    style: const TextStyle(
                        color: AppColors.light,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "=",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: getFontSize(30, getDeviceWidth(context)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: getDeviceWidth(context) * 0.27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.darkGrey,
                  ),
                  child: TextField(
                    onSubmitted: (val) {
                      if (result == int.parse(val)) {
                        showSnackBar(
                            "Buddy Your Answer is right cool !", context);
                      } else {
                        showSnackBar(
                            "Buddy Your Answer is wrong try again", context);
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "________",
                      hintStyle: const TextStyle(
                          color: AppColors.light,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors
                                .red, // Replace with your desired border color
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    style: const TextStyle(
                        color: AppColors.light,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (result == int.parse(controller.text)) {
                      showSnackBar(
                          "Buddy Your Answer is right cool !", context);
                    } else {
                      showSnackBar(
                          "Buddy Your Answer is wrong try again", context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.darkGrey,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.primary,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const CircularProgressIndicator(
            color: AppColors.primary,
          );
  }
}
