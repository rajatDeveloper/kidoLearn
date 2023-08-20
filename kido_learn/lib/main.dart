import 'package:flutter/material.dart';
import 'package:kido_learn/module/splash/screen/splash_screen.dart';
import 'package:kido_learn/utils/routes/routers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  List<String> devices = [
    "emulator64_x86_64_arm64",
    "sdk_gphone64_x86_64",
    "Google",
    "31"
  ];

  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();
  RequestConfiguration configuration = RequestConfiguration(
    testDeviceIds: devices,
  );
  MobileAds.instance.updateRequestConfiguration(configuration);

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
