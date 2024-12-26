import 'package:flutter/material.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Toy Story',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '2024.11.27',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '부제',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Text(
            '100분',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
