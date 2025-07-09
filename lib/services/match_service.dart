// lib/services/match_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../feature/matches/model/match_model.dart';

class MatchService {
  final CollectionReference _matchRef =
      FirebaseFirestore.instance.collection('matches');
  final CollectionReference _teamRef =
      FirebaseFirestore.instance.collection('teams');

  Future<List<MatchModel>> fetchMatches() async {
    final snapshot = await _matchRef.get();
    return snapshot.docs
        .map((doc) => MatchModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<Map<String, Map<String, dynamic>>> fetchTeamsMap() async {
    final snapshot = await _teamRef.get();
    return {
      for (var doc in snapshot.docs)
        (doc.data() as Map<String, dynamic>)['name']:
            doc.data() as Map<String, dynamic>
    };
  }
}
