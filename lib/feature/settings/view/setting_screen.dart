import 'package:flutter/material.dart';
import 'package:syriagoal/feature/widgets/app_bar_widget.dart';

class SettingScreen extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SettingScreen({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'العربية';

    return Scaffold(
      appBar: AppBarWidget(
        appBarTitle: 'الإعدادات',
        leadingIcon: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'عام',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('اللغة'),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: ['العربية', 'English'].map((lang) {
                return DropdownMenuItem(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (value) {

              },
            ),
          ),
          const Divider(),

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('الوضع الليلي'),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('حول التطبيق'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Syria Goal',
                applicationVersion: '1.0.0',
                children: const [
                  Text('تطبيق لمتابعة الكرة السورية بكل تفاصيلها.')
                ],
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('اتصل بنا'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('contact@syria-goal.com')),
              );
            },
          ),
        ],
      ),
    );
  }
}
