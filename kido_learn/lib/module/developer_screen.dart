import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/assets.dart';
import 'package:kido_learn/utils/helping_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  static String routeName = '/developer';
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.dark,
        title: const Text(
          'About Developer',
          style: TextStyle(color: AppColors.primary),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              SlideInDown(
                  child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.primary, width: 2),
                  image: const DecorationImage(
                    image: AssetImage(devImage),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Hello, my name is Rajat. \n\nI possess strong skills that can significantly contribute to your startup ideas, ensuring their success in the market. My expertise lies in crafting single-page websites, dynamic websites like E-commerce platforms, and robust web applications. Additionally, I am proficient in mobile app development, particularly in using Flutter for creating hybrid applications compatible with Android, iOS, Windows, macOS, and more. For native Android development, I am well-versed in using Java.\n\nFurthermore, my proficiency in logic and data structures and algorithms (DSA) allows me to approach problem-solving with a high level of efficiency and effectiveness.\n\nI look forward to collaborating and leveraging my skills to propel your projects to the forefront of the industry. Feel free to reach out for any assistance or partnership opportunities.",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 18),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Want to discuss your idea ?",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: getFontSize(18, getDeviceWidth(context)),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 1,
                width: getDeviceWidth(context) * 0.9,
                color: AppColors.primaryAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        sndWhatsAppMsg(
                            number: "+918607749965",
                            msg:
                                "Want to discuss idea , connected through Learn Now App ",
                            context: context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.primaryAccent, width: 2),
                        ),
                        child: const Text(
                          "WhatsApp",
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
