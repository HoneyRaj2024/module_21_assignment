import 'package:flutter/material.dart';
import 'package:module_21_assignment/widgets/score_column.dart';
import 'package:module_21_assignment/widgets/team_column.dart';

class TopMatchCard extends StatelessWidget {
  final Map<String, dynamic> matchData;

  const TopMatchCard({super.key, required this.matchData});

  @override
  Widget build(BuildContext context) {
    final homeTeam = matchData['teams']['home'];
    final awayTeam = matchData['teams']['away'];
    final homeScore = matchData['goals']['home'];
    final awayScore = matchData['goals']['away'];
    final elapsed = matchData['fixture']['status']['elapsed'] ?? 'Not Started';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:
              const LinearGradient(colors: [Colors.deepPurple, Colors.indigo]),
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
              18.0), // Larger padding for bigger appearance
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Time: $elapsed\'',
                  style: const TextStyle(
                    fontSize: 20, // Larger font size for the top card
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TeamColumn(
                          logoUrl: homeTeam['logo'],
                          name: homeTeam['name'],
                          fontSize: 20)),
                  Expanded(
                      child: ScoreColumn(
                          homeScore: homeScore,
                          awayScore: awayScore,
                          fontSize: 20)),
                  Expanded(
                      child: TeamColumn(
                          logoUrl: awayTeam['logo'],
                          name: awayTeam['name'],
                          fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
