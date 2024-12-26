import 'package:flutter/material.dart';

class InfoCategory extends StatelessWidget {
  const InfoCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                'Animation',
                style: TextStyle(color: Colors.blue),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 12);
          },
          itemCount: 6),
    );
  }
}
