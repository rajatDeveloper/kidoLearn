import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kido_learn/module/Test/screens/test_screen.dart';
import 'package:kido_learn/module/home/widgets/gridCard.dart';
import 'package:kido_learn/module/home/widgets/tapOn.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/helping_functions.dart';
import 'package:kido_learn/utils/music_controller.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    MusicController.loadAndPlayMusic();
  }

  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
            height: 55,
            width: getDeviceWidth(context),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              border: Border.all(color: AppColors.primary, width: 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grid View",
                    style: TextStyle(color: AppColors.lightGrey),
                  ),
                  Switch(
                    value: isGridView,
                    onChanged: (value) {
                      setState(() {
                        isGridView = value;
                      });
                    },
                    activeTrackColor: AppColors.primary,
                    activeColor: AppColors.lightGrey,
                  ),
                ],
              ),
            )),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.dark,
      drawer: Drawer(
        backgroundColor: AppColors.darkGrey,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text("Kido Learn",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: getFontSize(35, getDeviceWidth(context)),
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("+ - × ÷",
                        style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: getFontSize(50, getDeviceWidth(context)),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.scoreboard, color: AppColors.primary),
              title: Text(
                'My Score',
                style: TextStyle(color: AppColors.primary),
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.dark.withOpacity(0.7),
        title: const Text(
          'Kido Learn',
          style: TextStyle(color: AppColors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              MusicController.isPlaying
                  ? MusicController.pauseMusic()
                  : MusicController.playMusic();

              setState(() {});
            },
            icon: MusicController.isPlaying
                ? const Icon(Icons.volume_up_sharp, color: AppColors.primary)
                : const Icon(Icons.volume_off_sharp, color: AppColors.primary),
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
          Container(
            alignment: Alignment.center,
            width: getDeviceWidth(context),
            decoration: const BoxDecoration(
              color: AppColors.primaryAccent,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 0),
              child: Text("Select the Operator to begin the game !",
                  style: TextStyle(
                      color: AppColors.light,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
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
          !isGridView
              ? Column(
                  children: [
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
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: getDeviceHeight(context) * 0.7,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        children: [
                          GridCard(
                              operator: "+",
                              text: "Addition",
                              onTap: () {
                                getDialogeBox("+");
                              }),
                          GridCard(
                              operator: "-",
                              text: "Subtraction",
                              onTap: () {
                                getDialogeBox("-");
                              }),
                          GridCard(
                              operator: "×",
                              text: "Multiplication",
                              onTap: () {
                                getDialogeBox("×");
                              }),
                          GridCard(
                              operator: "÷",
                              text: "Division",
                              onTap: () {
                                getDialogeBox("÷");
                              }),
                        ]),
                  ),
                ),
        ],
      ),
    );
  }
}
