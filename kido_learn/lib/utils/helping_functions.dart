import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double getFontSize(double size, double screenWidth) {
  return size * screenWidth / 414;
}

showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

void setDataToLocal({required String key, required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getSavedDataByKey({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? data = prefs.getString(key);
  return data ?? "";
}
