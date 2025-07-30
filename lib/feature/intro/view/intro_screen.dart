import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syriagoal/feature/intro/controller/intro_provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  final List<Map<String, String>> introPages = const [
    {
      'title': 'مرحباً بك في الدوري السوري',
      'subtitle': 'تابع أحدث المباريات ونتائج الفرق المفضلة لديك.',
      'image': 'assets/images/splash_screen.jpeg',
    },
    {
      'title': 'تعرف على الفرق واللاعبين',
      'subtitle': 'استعرض معلومات شاملة عن كل فريق ولاعب.',
      'image': 'assets/images/splash_screen.jpeg',
    },
    {
      'title': 'ابدأ الآن!',
      'subtitle': 'اكتشف كل ما يتعلق بكرة القدم السورية.',
      'image': 'assets/images/splash_screen.jpeg',
    },
  ];

  void goToMainScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IntroProvider>(context);

    return Scaffold(
      body: PageView.builder(
        controller: provider.pageController,
        itemCount: introPages.length,
        onPageChanged: provider.setCurrentIndex,
        itemBuilder: (context, index) {
          final page = introPages[index];
          return Container(
            padding: const EdgeInsets.all(24),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  page['image']!,
                  height: 250,
                ),
                const SizedBox(height: 40),
                Text(
                  page['title']!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  page['subtitle']!,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: OutlinedButton(
                    onPressed: () {
                      if (index == introPages.length - 1) {
                        goToMainScreen(context);
                      } else {
                        provider.nextPage();
                      }
                    },
                    child: Center(
                      child: Text(
                        index == introPages.length - 1
                            ? 'ابدأ الآن'
                            : 'التالي',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
