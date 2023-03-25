import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/first_splash_screen.dart';

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
      // home: AdminDashboard(),
      home: FirstSplashScreen(),
      // home: MainScreen(),
    );
  }
}
