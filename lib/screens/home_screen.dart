import 'package:flutter/material.dart';
import 'package:malina_test/screens/korzina_screen.dart';
import 'package:malina_test/screens/main_screen.dart';
import 'package:malina_test/screens/profile_screen.dart';
import 'package:malina_test/screens/qr_scanner_screen.dart';
import 'package:malina_test/screens/save_screen.dart';
import 'package:malina_test/widgets/my_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _pages => [
    MainScreen(),
    SaveScreen(),
    QRScannerScreen(),
    ProfileScreen(),
    KorzinaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5fb),
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
