import 'package:flutter/material.dart';
import 'package:module_21_assignment/widgets/score_column.dart';
import 'package:module_21_assignment/widgets/team_column.dart';

class MatchCard extends StatelessWidget {
  final Map<String, dynamic> matchData;
  final int index;

  const MatchCard({super.key, required this.matchData, required this.index});

  @override
  Widget build(BuildContext context) {
    final match = matchData['fixture'];
    final homeTeam = matchData['teams']['home'];
    final awayTeam = matchData['teams']['away'];
    final homeScore = matchData['goals']['home'];
    final awayScore = matchData['goals']['away'];
    final elapsed = match['status']['elapsed'] ?? 'Not Started';

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 4.0, horizontal: 16.0), // Smaller vertical padding
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: _getCardGradient(index),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              12.0), // Smaller padding for smaller appearance
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Time: $elapsed\'',
                  style: const TextStyle(
                    fontSize: 16, // Smaller font size for smaller cards
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TeamColumn(
                          logoUrl: homeTeam['logo'],
                          name: homeTeam['name'],
                          fontSize: 14)),
                  Expanded(
                      child: ScoreColumn(
                          homeScore: homeScore,
                          awayScore: awayScore,
                          fontSize: 20)),
                  Expanded(
                      child: TeamColumn(
                          logoUrl: awayTeam['logo'],
                          name: awayTeam['name'],
                          fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient _getCardGradient(int index) {
    List<LinearGradient> gradients = [
      const LinearGradient(colors: [Colors.blue, Colors.purple]),
      const LinearGradient(colors: [Colors.orange, Colors.red]),
      const LinearGradient(colors: [Colors.green, Colors.teal]),
      const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
      const LinearGradient(colors: [Colors.pink, Colors.deepOrange]),
    ];

    return gradients[index % gradients.length];
  }
}
