class Player {
  final String name;
  final String imageUrl;
  final String description;

  Player({required this.name, required this.imageUrl, required this.description});

  factory Player.fromMap(Map<String, dynamic> data) {
    return Player(
      name: data['name'],
      imageUrl: data['imageUrl'],
      description: data['description'],
    );
  }

 
}
