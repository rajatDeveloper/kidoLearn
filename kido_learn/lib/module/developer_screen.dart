import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kido_learn/utils/appColor.dart';
import 'package:kido_learn/utils/assets.dart';

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
                  image: DecorationImage(
                    image: AssetImage(devImage),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              SlideInUp(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Hello, my name is Rajat. \n\nI possess strong skills that can significantly contribute to your startup ideas, ensuring their success in the market. My expertise lies in crafting single-page websites, dynamic websites like E-commerce platforms, and robust web applications. Additionally, I am proficient in mobile app development, particularly in using Flutter for creating hybrid applications compatible with Android, iOS, Windows, macOS, and more. For native Android development, I am well-versed in using Java.\n\nFurthermore, my proficiency in logic and data structures and algorithms (DSA) allows me to approach problem-solving with a high level of efficiency and effectiveness.\n\nI look forward to collaborating and leveraging my skills to propel your projects to the forefront of the industry. Feel free to reach out for any assistance or partnership opportunities.",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
