import 'package:flutter/material.dart';
import 'package:malina_test/screens/home_screen.dart';
import 'package:malina_test/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      // home: const LoginScreen(),
      home: const HomeScreen(),
      //вернуть экран логин 
    );
  }
}