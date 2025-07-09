import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syriagoal/feature/bestplayers/view/best_player_screen.dart';
import 'package:syriagoal/feature/home/view/splash_screen.dart';
import 'package:syriagoal/feature/intro/view/intro_screen.dart';
import 'package:syriagoal/feature/home/view/home_screen.dart';
import 'package:syriagoal/feature/standing/view/standing_screen.dart';
import 'package:syriagoal/feature/settings/view/setting_screen.dart';
import 'package:syriagoal/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/intro': (context) => const IntroScreen(),
        '/home': (context) => const HomeScreen(),
        '/standing': (context) => StandingsScreen(),
        '/bestPlayers': (context) => BestPlayersScreen(),
        '/settings': (context) => SettingScreen(
              isDarkMode: _themeMode == ThemeMode.dark,
              onThemeChanged: toggleTheme,
            ),
      },
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
