import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  // ignore: unused_field
  int _currentIndex = 0;

  List<Map<String, String>> introPages = [
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

  void goToMainScreen() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: introPages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  page['subtitle']!,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                if (index == introPages.length - 1)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/home'),
                      child: Center(child: const Text('ابدأ الآن')),
                    ),
                  )
                else
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: OutlinedButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Center(
                          child: const Text(
                        'التالي',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
