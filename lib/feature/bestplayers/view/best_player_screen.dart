import 'package:flutter/material.dart';
import '../model/player_model.dart';
import 'player_details_screen.dart';

class BestPlayersScreen extends StatelessWidget {
  BestPlayersScreen({super.key});

  final List<Player> players = [
    Player(
      name: 'محمد صلاح',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mo_Salah_2018.jpg/220px-Mo_Salah_2018.jpg',
      description: 'أفضل هداف سنة 2023',
    ),
    Player(
      name: 'كريستيانو رونالدو',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/220px-Cristiano_Ronaldo_2018.jpg',
      description: 'أفضل لاعب في الدوري',
    ),
    Player(
      name: 'ليونيل ميسي',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/220px-Lionel_Messi_20180626.jpg',
      description: 'أفضل لاعب في كأس العالم',
    ),
    Player(
      name: 'محمد صلاح',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mo_Salah_2018.jpg/220px-Mo_Salah_2018.jpg',
      description: 'أفضل هداف سنة 2023',
    ),
    Player(
      name: 'كريستيانو رونالدو',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/220px-Cristiano_Ronaldo_2018.jpg',
      description: 'أفضل لاعب في الدوري',
    ),
    Player(
      name: 'ليونيل ميسي',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/220px-Lionel_Messi_20180626.jpg',
      description: 'أفضل لاعب في كأس العالم',
    ),
    Player(
      name: 'محمد صلاح',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mo_Salah_2018.jpg/220px-Mo_Salah_2018.jpg',
      description: 'أفضل هداف سنة 2023',
    ),
    Player(
      name: 'كريستيانو رونالدو',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/220px-Cristiano_Ronaldo_2018.jpg',
      description: 'أفضل لاعب في الدوري',
    ),
    Player(
      name: 'ليونيل ميسي',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/220px-Lionel_Messi_20180626.jpg',
      description: 'أفضل لاعب في كأس العالم',
    ),
    Player(
      name: 'محمد صلاح',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mo_Salah_2018.jpg/220px-Mo_Salah_2018.jpg',
      description: 'أفضل هداف سنة 2023',
    ),
    Player(
      name: 'كريستيانو رونالدو',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/220px-Cristiano_Ronaldo_2018.jpg',
      description: 'أفضل لاعب في الدوري',
    ),
    Player(
      name: 'ليونيل ميسي',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Lionel_Messi_20180626.jpg/220px-Lionel_Messi_20180626.jpg',
      description: 'أفضل لاعب في كأس العالم',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: ClipOval(
                child: Image.network(
                  player.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) => const Icon(Icons.error),
                ),
              ),
              title: Text(player.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(player.description,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PlayerDetailsScreen(player: player)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
