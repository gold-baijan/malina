import 'package:flutter/material.dart';
import 'package:malina_test/widgets/main_content.dart';
import 'package:malina_test/widgets/my_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: MyAppBar(),
      ),
      body: MainContent(),
    );
  }
}
