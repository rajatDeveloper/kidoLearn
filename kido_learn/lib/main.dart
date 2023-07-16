import 'package:flutter/material.dart';
import 'package:kido_learn/module/splash/screen/splash_screen.dart';
import 'package:kido_learn/utils/routes/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kido Learn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: SplashScreen.routeName,
      routes: getAppRoutes(),
    );
  }
}
