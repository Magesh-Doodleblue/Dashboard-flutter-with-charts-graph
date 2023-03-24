import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warpe_dashboard_task/presentation/screens/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: SplashScreen(),
    );
  }
}
