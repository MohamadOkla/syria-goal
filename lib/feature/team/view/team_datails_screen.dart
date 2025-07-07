import 'package:flutter/material.dart';

class TeamDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> team;

  const TeamDetailsScreen({required this.team, super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> players = team['players'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(team['name']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(team['logo']),
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'المدرب: ${team['coach']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                ': قائمة اللاعبين ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(player['number'].toString()),
                      ),
                      title: Text(player['name']),
                      subtitle: Text('المركز: ${player['position']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
