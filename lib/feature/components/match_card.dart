import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final Map<String, dynamic> match;
  final Map<String, dynamic>? team1Data;
  final Map<String, dynamic>? team2Data;

  const MatchCard({
    required this.match,
    required this.team1Data,
    required this.team2Data,
    super.key,
  });

  Widget _buildTeamAvatar(Map<String, dynamic>? teamData) {
    String? logoPath = teamData?['logo'];
    if (logoPath == null || logoPath.isEmpty) {
      return CircleAvatar(
        backgroundImage: AssetImage('assets/images/default_photo.jpeg'),
        radius: 28,
        backgroundColor: Colors.grey.shade200,
      );
    }
    return CircleAvatar(
      backgroundImage: NetworkImage(logoPath),
      radius: 28,
      backgroundColor: Colors.grey.shade200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _buildTeamAvatar(team1Data),
                const SizedBox(height: 8),
                Text(
                  team1Data != null ? team1Data!['name'] : match['team1'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  match['result'].isNotEmpty
                      ? match['result']
                      : '${match['date']} \n${match['time']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: match['result'].isNotEmpty
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                _buildTeamAvatar(team2Data),
                const SizedBox(height: 8),
                Text(
                  team2Data != null ? team2Data!['name'] : match['team2'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
