import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_learn/module/Test/widgets/block.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class TestScreen extends StatefulWidget {
  static const String routeName = "/test-screen";

  final String operator;
  final String num;

  const TestScreen({super.key, required this.operator, required this.num});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // int? numOfTest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("op : ${widget.operator} and num ${widget.num}");
    // getDialogeBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.primary),
          backgroundColor: AppColors.dark,
        ),
        body: Container(
            height: getDeviceHeight(context) * 0.8,
            child: widget.num != null
                ? ListView.builder(
                    itemCount: int.parse(widget.num),
                    itemBuilder: (BuildContext context, int index) {
                      return BlockData(
                        operator: widget.operator,
                      );
                    })
                : const Center(
                    child: CircularProgressIndicator(),
                  )
            //     Column(
            //   children: [
            //     BlockData(
            //       operator: widget.operator,
            //     ),
            //     BlockData(
            //       operator: widget.operator,
            //     ),
            //     BlockData(
            //       operator: widget.operator,
            //     ),
            //     BlockData(
            //       operator: widget.operator,
            //     ),
            //     BlockData(
            //       operator: widget.operator,
            //     ),
            //     BlockData(
            //       operator: widget.operator,
            //     )
            //   ],
            // ),
            ));
  }
}
