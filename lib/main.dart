import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syriagoal/feature/bestplayers/view/best_player_screen.dart';
import 'package:syriagoal/feature/home/view/splash_screen.dart';
import 'package:syriagoal/feature/intro/controller/intro_provider.dart';
import 'package:syriagoal/feature/intro/view/intro_screen.dart';
import 'package:syriagoal/feature/home/view/home_screen.dart';
import 'package:syriagoal/feature/standing/view/standing_screen.dart';
import 'package:syriagoal/feature/settings/view/setting_screen.dart';
import 'package:syriagoal/firebase_options.dart';
import 'package:syriagoal/feature/home/controller/home_state_provider.dart';
import 'package:syriagoal/utils/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => HomeStateProvider()),
        ChangeNotifierProvider(create: (_) => IntroProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/intro': (context) => const IntroScreen(),
            '/home': (context) => const HomeScreen(),
            '/standing': (context) => StandingsScreen(),
            '/bestPlayers': (context) => BestPlayersScreen(),
            '/settings': (context) {
              final themeProvider =
                  Provider.of<ThemeProvider>(context, listen: false);
              return SettingScreen(
                isDarkMode: themeProvider.themeMode == ThemeMode.dark,
                onThemeChanged: (bool isDark) {
                  themeProvider.toggleTheme(isDark);
                },
              );
            },
          },
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
        );
      },
    );
  }
}
