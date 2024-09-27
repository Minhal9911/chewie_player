import 'package:flutter/material.dart';
import 'package:poc_flutter/screen/intro_screen.dart';
import 'package:poc_flutter/screen/onboard_screen.dart';
import 'package:poc_flutter/screen/share_ui.dart';
import 'package:poc_flutter/screen/video_screen.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/screen/home_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardScreen(),
    );
  }
}
