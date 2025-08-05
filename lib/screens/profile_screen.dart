import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_sharp),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [const Text("Профиль")],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Выйти',
              style: TextStyle(
                color: Color(0xff1d1d1d),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
