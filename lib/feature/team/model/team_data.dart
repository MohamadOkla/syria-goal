import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String name;
  final int number;
  final String position;
  final String photo;

  Player({
    required this.name,
    required this.number,
    required this.position,
    required this.photo,
  });

  factory Player.fromMap(Map<String, dynamic> data) {
    return Player(
      name: data['name'] ?? '',
      number: data['number'] ?? 0,
      position: data['position'] ?? '',
      photo: data['photo'] ?? '',
    );
  }
}

class Team {
  final String name;
  final String logo;
  final String coach;
  final List<Player> players;

  Team({
    required this.name,
    required this.logo,
    required this.coach,
    required this.players,
  });

  factory Team.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final playersData = data['players'] as List<dynamic>? ?? [];

    return Team(
      name: data['name'] ?? '',
      logo: data['logo'] ?? '',
      coach: data['coach'] ?? '',
      players: playersData.map((playerData) => Player.fromMap(playerData)).toList(),
    );
  }
}

Future<List<Team>> fetchTeams() async {
  final snapshot = await FirebaseFirestore.instance.collection('teams').get();
  return snapshot.docs.map((doc) => Team.fromDocument(doc)).toList();
}
