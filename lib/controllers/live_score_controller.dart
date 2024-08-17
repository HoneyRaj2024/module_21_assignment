import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LiveScoreController extends GetxController {
  final liveScores = [].obs;
  final isLoading = true.obs;
  final totalMatchCount = 0.obs;
  final totalVenueCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLiveScores();
  }

  Future<void> fetchLiveScores() async {
    isLoading(true);
    try {
      final response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/fixtures?live=all'),
        headers: {
          'x-rapidapi-host': 'v3.football.api-sports.io',
          'x-rapidapi-key': '8b6f532c9ec8b467ccdee569e38d1439',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        liveScores.value = data['response'];
        totalMatchCount.value = liveScores.length;

        // Calculate unique venues
        final venues = liveScores.map((match) => match['fixture']['venue']['name']).toSet();
        totalVenueCount.value = venues.length;
      }
    } catch (e) {
      print('Error fetching live scores: $e');
    } finally {
      isLoading(false);
    }
  }
}
