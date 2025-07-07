import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final Map<String, dynamic> team;
  final VoidCallback onTap;

  const TeamCard({required this.team, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(team['logo']),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          team['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
