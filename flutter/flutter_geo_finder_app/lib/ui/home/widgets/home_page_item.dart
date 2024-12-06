import 'package:flutter/material.dart';
import 'package:flutter_geo_finder_app/ui/detail/detail_page.dart';

class HomePageItem extends StatelessWidget {
  String title;
  String link;
  String category;
  String roadAddress;

  HomePageItem({
    super.key,
    required this.title,
    required this.link,
    required this.category,
    required this.roadAddress,
  });

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
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(category,
                  style: TextStyle(fontSize: 16, color: Colors.grey[800])),
              const SizedBox(height: 2),
              Text(roadAddress,
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]))
            ],
          ),
        ),
      ),
    );
  }
}
