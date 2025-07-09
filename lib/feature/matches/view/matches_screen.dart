import 'package:flutter/material.dart';
  import 'package:syriagoal/services/match_service.dart';
import '../model/match_model.dart';
import '../../components/match_card.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchService = MatchService();

    return Scaffold(
      body: FutureBuilder<List<MatchModel>>(
        future: matchService.fetchMatches(),
        builder: (context, matchSnapshot) {
          if (matchSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (matchSnapshot.hasError) {
            return Center(
                child: Text("خطأ في تحميل المباريات: ${matchSnapshot.error}"));
          }
          final matches = matchSnapshot.data;
          if (matches == null || matches.isEmpty) {
            return const Center(child: Text("لا توجد مباريات حالياً."));
          }

          return FutureBuilder<Map<String, Map<String, dynamic>>>(
            future: matchService.fetchTeamsMap(),
            builder: (context, teamSnapshot) {
              if (teamSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (teamSnapshot.hasError) {
                return Center(
                    child: Text("خطأ في تحميل الفرق: ${teamSnapshot.error}"));
              }
              final teamsMap = teamSnapshot.data ?? {};

              return ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  final match = matches[index];
                  final team1 = teamsMap[match.team1];
                  final team2 = teamsMap[match.team2];

                  return MatchCard(
                    match: {
                      'team1': match.team1,
                      'team2': match.team2,
                      'date': match.date,
                      'time': match.time,
                      'result': match.result,
                    },
                    team1Data: team1,
                    team2Data: team2,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
