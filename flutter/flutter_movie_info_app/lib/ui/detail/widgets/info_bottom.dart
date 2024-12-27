import 'package:flutter/material.dart';

class InfoBottom extends StatelessWidget {
  const InfoBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            '흥행정보',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 78,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '6.934\n평점',
                  textAlign: TextAlign.center,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: 5,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                height: 80,
                color: Colors.white,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
