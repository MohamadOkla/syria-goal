import 'package:flutter/material.dart';
import 'package:syriagoal/feature/standing/model/standing_model.dart';
import 'package:syriagoal/utils/constant.dart';

class StandingsScreen extends StatelessWidget {
  StandingsScreen({super.key});

  final List<TeamStanding> standings = [
    TeamStanding(
      teamName: 'الجيش',
      imagePath: 'assets/images/aljaysh.jpeg',
      played: 10,
      won: 7,
      drawn: 2,
      lost: 1,
      points: 23,
    ),
    TeamStanding(
      teamName: 'الكرامة',
      imagePath: 'assets/images/alkaramah.jpeg',
      played: 10,
      won: 6,
      drawn: 3,
      lost: 1,
      points: 21,
    ),
    TeamStanding(
      teamName: 'تشرين',
      imagePath: 'assets/images/tishreen.jpeg',
      played: 10,
      won: 5,
      drawn: 4,
      lost: 1,
      points: 19,
    ),
    TeamStanding(
      teamName: 'الوحدة',
      imagePath: 'assets/images/alwahda.jpeg',
      played: 10,
      won: 5,
      drawn: 2,
      lost: 3,
      points: 17,
    ),
    TeamStanding(
      teamName: 'الاتحاد',
      imagePath: 'assets/images/aljaysh.jpeg',
      played: 10,
      won: 7,
      drawn: 2,
      lost: 1,
      points: 23,
    ),
    TeamStanding(
      teamName: 'الشباب',
      imagePath: 'assets/images/alkaramah.jpeg',
      played: 10,
      won: 6,
      drawn: 3,
      lost: 1,
      points: 21,
    ),
    TeamStanding(
      teamName: 'الشرطة',
      imagePath: 'assets/images/tishreen.jpeg',
      played: 10,
      won: 5,
      drawn: 4,
      lost: 1,
      points: 19,
    ),
    TeamStanding(
      teamName: 'الفتوة',
      imagePath: 'assets/images/alwahda.jpeg',
      played: 10,
      won: 5,
      drawn: 2,
      lost: 3,
      points: 17,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: standings.length,
        separatorBuilder: (_, __) => const SizedBox(height: 0.5),
        itemBuilder: (context, index) {
          final team = standings[index];
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(team.imagePath),
                    radius: 25,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          team.teamName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'لعب: ${team.played} | فاز: ${team.won} | تعادل: ${team.drawn} | خسر: ${team.lost}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Constant.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${team.points} نقطة',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
