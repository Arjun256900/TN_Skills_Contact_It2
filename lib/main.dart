import 'package:contacts_app_2/core/hive/hive_init.dart';
import 'package:contacts_app_2/core/theme/app_theme.dart';
import 'package:contacts_app_2/features/contacts/controllers/contact_controller.dart';
import 'package:contacts_app_2/features/contacts/presentation/screens/contacts_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _theme = ThemeMode.system;

  void _toggleTheme(ThemeMode newThemeMode) {
    setState(() {
      _theme = newThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactController(),
      child: MaterialApp(
        themeMode: _theme,
        theme: kLightThemeMode,
        darkTheme: kDarkThemeMode,
        debugShowCheckedModeBanner: false,
        home: ContactsListScreen(toggleTheme: _toggleTheme),
      ),
    );
  }
}
