import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syriagoal/feature/bestplayers/model/player_model.dart';
class PlayerService {
  static Future<List<Player>> fetchPlayers() async {
    final snapshot = await FirebaseFirestore.instance.collection('players').get();
    return snapshot.docs.map((doc) => Player.fromMap(doc.data())).toList();
  }
}
