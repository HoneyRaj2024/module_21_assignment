import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:module_21_assignment/controllers/live_score_controller.dart';
import 'package:module_21_assignment/widgets/info_header.dart';
import 'package:module_21_assignment/widgets/match_card.dart';
import 'package:module_21_assignment/widgets/top_match_card.dart';

class LiveScoreScreen extends StatelessWidget {
  const LiveScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveScoreController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Football Scores',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/animation.json', // Path to your Lottie file
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
          );
        } else if (controller.liveScores.isEmpty) {
          return const Center(
            child: Text('No live matches currently.'),
          );
        } else {
          return Column(
            children: [
              InfoHeader(controller: controller),
              const SizedBox(height: 1),
              TopMatchCard(matchData: controller.liveScores.first),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.liveScores.length,
                  itemBuilder: (context, index) {
                    return MatchCard(
                        matchData: controller.liveScores[index], index: index);
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
