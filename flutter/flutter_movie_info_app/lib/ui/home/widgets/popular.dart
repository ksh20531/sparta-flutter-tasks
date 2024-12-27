import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '인기순',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    width: 160,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/ToyStory.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 14,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
