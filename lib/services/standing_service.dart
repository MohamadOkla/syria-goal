import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syriagoal/feature/standing/model/standing_model.dart';

class StandingService {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('standings');

  Future<List<TeamStanding>> fetchStandings() async {
    final snapshot = await _collection.get();
    return snapshot.docs
        .map((doc) => TeamStanding.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
