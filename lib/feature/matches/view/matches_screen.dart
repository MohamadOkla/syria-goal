import 'package:flutter/material.dart';
import '../model/match_data.dart';
import '../../team/model/team_data.dart';
import '../../components/match_card.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  Map<String, dynamic>? getTeamByName(String name) {
    try {
      return teams.firstWhere((team) => team['name'] == name);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView.builder(
        itemCount: matchData.length,
        itemBuilder: (context, index) {
          final match = matchData[index];

          final team1 = getTeamByName(match['team1']);
          final team2 = getTeamByName(match['team2']);

          return MatchCard(
            match: match,
            team1Data: team1,
            team2Data: team2,
          );
        },
      ),
    );
  }
}
