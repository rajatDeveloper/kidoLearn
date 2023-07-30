import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/assets.dart';
import 'package:kido_learn/utils/helping_functions.dart';

class MyScoreScreen extends StatefulWidget {
  static String routeName = '/my-score';
  const MyScoreScreen({super.key});

  @override
  State<MyScoreScreen> createState() => _MyScoreScreenState();
}

class _MyScoreScreenState extends State<MyScoreScreen> {
  String score = "0";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScore();
  }

  void getScore() async {
    var data = await getSavedDataByKey(key: "score");
    if (data == "") {
      data = "0";
    }

    setState(() {
      score = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.dark,
        title: const Text(
          'My Score',
          style: TextStyle(color: AppColors.primary),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SlideInDown(child: Image.asset(kidImage)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SlideInUp(
                      child: Text(
                        'Your Total Score',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    SlideInUp(
                      child: Text(
                        score,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     SlideInUp(
                //       child: Text(
                //         'Your Highest Score',
                //         style: TextStyle(
                //           color: AppColors.primary,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     SlideInUp(
                //       child: Text(
                //         '0',
                //         style: TextStyle(
                //           color: AppColors.primary,
                //           fontSize: 30,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
