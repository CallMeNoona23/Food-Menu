import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/food_menu_screen.dart';

void main() {
  runApp(const FoodMenuApp());
}

class FoodMenuApp extends StatefulWidget {
  const FoodMenuApp({super.key});

  @override
  State<FoodMenuApp> createState() => _FoodMenuAppState();
}

class _FoodMenuAppState extends State<FoodMenuApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: FoodMenuScreen(
        currentThemeMode: _themeMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
