import 'package:flutter/material.dart';

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '가장 인기있는',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/ToyStory.jpg',
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
