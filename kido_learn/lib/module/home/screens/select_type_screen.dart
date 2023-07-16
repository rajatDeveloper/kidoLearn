import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kido_learn/module/Test/screens/test_screen.dart';
import 'package:kido_learn/module/home/widgets/tapOn.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class SelectTabScreen extends StatefulWidget {
  static const String routeName = "/select-tab-screen";
  const SelectTabScreen({super.key});

  @override
  State<SelectTabScreen> createState() => _SelectTabScreenState();
}


class _SelectTabScreenState extends State<SelectTabScreen> {
  final TextEditingController numTestController = TextEditingController();

  getDialogeBox(String op) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter total number of test you want to take'),
          content: TextField(
            controller: numTestController,
            onSubmitted: (val) {
              Navigator.of(context).pop();
              log("num by us : ${numTestController.text}");
              Navigator.pushNamed(context, TestScreen.routeName, arguments: {
                'num': val,
                'op': op,
              });
              numTestController.clear();
            },
            decoration: InputDecoration(
              hintText: 'Enter total number of test',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                numTestController.clear();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                // Perform any action with the entered value
                Navigator.of(context).pop();
                log("num by us : ${numTestController.text}");
                Navigator.pushNamed(context, TestScreen.routeName, arguments: {
                  'num': numTestController.text,
                  'op': op,
                });
                numTestController.clear();
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        backgroundColor: AppColors.dark.withOpacity(0.7),
        title: const Text(
          'Kido Learn',
          style: TextStyle(color: AppColors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: true
                ? const Icon(Icons.volume_off_sharp, color: AppColors.primary)
                : const Icon(Icons.volume_up_sharp, color: AppColors.primary),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            width: getDeviceWidth(context),
            color: AppColors.primary,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 0),
            child: Text("Select the Operator to begin the game !",
                style: TextStyle(
                    color: AppColors.light,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 1,
            width: getDeviceWidth(context),
            color: AppColors.primary,
          ),
          const SizedBox(
            height: 10,
          ),
          // addition subtraction multiplication division
          TapOn(
              operator: "+",
              text: "Addition",
              onTap: () {
                getDialogeBox("+");
              }),
          TapOn(
              operator: "-",
              text: "Subtraction",
              onTap: () {
                getDialogeBox("-");
              }),
          TapOn(
              operator: "×",
              text: "Multiplication",
              onTap: () {
                getDialogeBox("×");
              }),
          TapOn(
              operator: "÷",
              text: "Division",
              onTap: () {
                getDialogeBox("÷");
              }),
        ],
      ),
    );
  }
}
