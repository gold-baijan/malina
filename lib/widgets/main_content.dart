import 'package:flutter/material.dart';
import 'package:malina_test/widgets/categories.dart';
import 'package:malina_test/widgets/qr_container.dart';
import 'package:malina_test/widgets/soon.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      children: [
        SizedBox(height: 8),
        QrCodeScanConcainer(),
        const SizedBox(height: 16),
        CategoriesRow(),
        const SizedBox(height: 20),
        SoonRow(),
        const SizedBox(height: 10),
      ],
    );
  }
}
