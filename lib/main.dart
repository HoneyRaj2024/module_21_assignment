import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_21_assignment/controllers/live_score_controller.dart';
import 'package:module_21_assignment/screens/live_score_screen.dart';

void main() {
  runApp(const FootballLiveScoreApp());
}

class FootballLiveScoreApp extends StatelessWidget {
  const FootballLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Live Scores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(
          LiveScoreController(),
        );
      }),
      home: LiveScoreScreen(),
    );
  }
}
