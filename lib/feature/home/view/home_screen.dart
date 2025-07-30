import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:syriagoal/feature/bestplayers/view/best_player_screen.dart';
import 'package:syriagoal/feature/standing/view/standing_screen.dart';
import 'package:syriagoal/feature/widgets/app_bar_widget.dart';
import 'package:syriagoal/feature/widgets/drawer_widget.dart';
import 'package:syriagoal/feature/matches/view/matches_screen.dart';
import 'package:syriagoal/utils/constant.dart';
import 'package:syriagoal/feature/home/controller/home_state_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> _appBarTitles = const [
    'الدوري السوري الممتاز',
    'المباريات',
    'جدول الترتيب',
    'أفضل اللاعبين',
  ];

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeStateProvider>(context);
    final selectedTeamIndex = homeState.selectedTeamIndex;
    final currentIndex = homeState.currentIndex;

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBarWidget(appBarTitle: _appBarTitles[currentIndex]),
      body: IndexedStack(
        index: currentIndex,
        children: [
          _buildTeamsScreen(context, selectedTeamIndex),
          const MatchesScreen(),
          StandingsScreen(),
          BestPlayersScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Constant.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (i) => homeState.setCurrentIndex(i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer), label: 'المباريات'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: 'الترتيب'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), label: 'أفضل اللاعبين'),
        ],
      ),
    );
  }

  Widget _buildTeamsScreen(BuildContext context, int selectedTeamIndex) {
    final homeState = Provider.of<HomeStateProvider>(context, listen: false);

    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('team').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
        }

        final teamsData = snapshot.data?.docs ?? [];

        if (teamsData.isEmpty) {
          return const Center(child: Text('لا توجد فرق مضافة بعد'));
        }

        final selectedTeam = teamsData[selectedTeamIndex];
        final teamMap = selectedTeam.data() as Map<String, dynamic>;
        final List players = teamMap['players'] ?? [];

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('الفرق',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: teamsData.length,
                  itemBuilder: (context, idx) {
                    final team = teamsData[idx].data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () => homeState.setSelectedTeamIndex(idx),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: idx == selectedTeamIndex
                                ? Constant.primaryColor
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(team['logo'] ??
                                  'assets/images/default_photo.jpeg'),
                            ),
                            const SizedBox(height: 8),
                            Text(team['name'] ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text('لاعبو فريق ${teamMap['name'] ?? ''}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Expanded(
                child: players.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline,
                                size: 40, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('لم يتم إدخال لاعبين لهذا الفريق بعد'),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: players.length,
                        itemBuilder: (context, i) {
                          final player = players[i] as Map<String, dynamic>;
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor:
                                    Constant.primaryColor.withOpacity(0.1),
                                child: Icon(Icons.person,
                                    size: 28, color: Constant.primaryColor),
                              ),
                              title: Text(player['name'] ?? ''),
                              subtitle: Text(player['position'] ?? ''),
                              trailing: Text('${player['number'] ?? ''}',
                                  style: TextStyle(
                                      color: Constant.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
