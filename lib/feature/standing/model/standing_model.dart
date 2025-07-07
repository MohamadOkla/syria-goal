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
}
