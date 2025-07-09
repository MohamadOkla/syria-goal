class TeamStanding {
  final String teamName;
  final String imagePath;
  final int played;
  final int won;
  final int drawn;
  final int lost;
  final int points;

  TeamStanding({
    required this.teamName,
    required this.imagePath,
    required this.played,
    required this.won,
    required this.drawn,
    required this.lost,
    required this.points,
  });

  factory TeamStanding.fromMap(Map<String, dynamic> map) {
    return TeamStanding(
      teamName: map['teamName'],
      imagePath: map['imagePath'],
      played: map['played'],
      won: map['won'],
      drawn: map['drawn'],
      lost: map['lost'],
      points: map['points'],
    );
  }
}
