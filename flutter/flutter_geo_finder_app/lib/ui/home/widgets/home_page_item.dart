import 'package:flutter/material.dart';
import 'package:flutter_geo_finder_app/ui/detail/detail_page.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('삼성1동 주민센터',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text('공공,사회기관>행적복지센터',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800])),
              const SizedBox(height: 2),
              Text('서울특별시 강남구 봉은사로 616 삼성1동 주민센터',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]))
            ],
          ),
        ),
      ),
    );
  }
}
