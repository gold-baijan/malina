import 'package:flutter/material.dart';
import 'package:malina_test/data/accounts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafb),
      appBar: AppBar(
        backgroundColor: Color(0xfffafafb),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
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
      body: ListView.builder(
        itemCount: validAccounts.length,
        itemBuilder: (context, index) {
          final account = validAccounts[index];
          return ListTile(
            title: Text(account['email'] ?? ''),
            // subtitle: Text(account['password'] ?? ''),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffECE6F0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
