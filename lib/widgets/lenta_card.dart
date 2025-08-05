import 'package:flutter/material.dart';

class LentaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color? overlayColor; // необязательный параметр

  const LentaCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      
    },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            if (overlayColor != null)
              Container(
                width: double.infinity,
                height: 180,
                color: overlayColor!,
              ),
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 24,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
