import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeamDetailsScreen extends StatelessWidget {
  final String teamId;

  const TeamDetailsScreen({required this.teamId, super.key});

  @override
  Widget build(BuildContext context) {
    final teamDoc = FirebaseFirestore.instance.collection('teams').doc(teamId);

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: teamDoc.get(),
        builder: (context, teamSnapshot) {
          if (teamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!teamSnapshot.hasData || !teamSnapshot.data!.exists) {
            return const Center(child: Text('لم يتم العثور على بيانات الفريق'));
          }

          final teamData = teamSnapshot.data!.data() as Map<String, dynamic>;
          // ignore: unused_local_variable
          final teamName = teamData['name'] ?? '';
          final teamLogo = teamData['logo'] ?? '';
          final coach = teamData['coach'] ?? '';

          return Column(
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(teamLogo),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              Text(
                'المدرب: $coach',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ': قائمة اللاعبين',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: teamDoc.collection('players').snapshots(),
                  builder: (context, playerSnapshot) {
                    if (playerSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!playerSnapshot.hasData ||
                        playerSnapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('لا يوجد لاعبين'));
                    }

                    final players = playerSnapshot.data!.docs;

                    return ListView.builder(
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        final player =
                            players[index].data() as Map<String, dynamic>;
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(player['photo']),
                            ),
                            title: Text(player['name']),
                            subtitle: Text(
                                'رقم ${player['number']} - ${player['position']}'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
