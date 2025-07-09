class MatchModel {
  final String team1;
  final String team2;
  final String date;   
  final String time;
  final String result;

  MatchModel({
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.result,
  });

  factory MatchModel.fromMap(Map<String, dynamic> data) {
    return MatchModel(
      team1: data['team1'] ?? '',
      team2: data['team2'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      result: data['result'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team1': team1,
      'team2': team2,
      'date': date,
      'time': time,
      'result': result,
    };
  }
}
