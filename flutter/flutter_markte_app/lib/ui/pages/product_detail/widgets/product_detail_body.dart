import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/widgets/UserProfileImage.dart';

class ProductDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileArea(),
          Divider(height: 30),
          Text(
            '아이폰 팝니다',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '디지털 가전 - 1분전',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '네고 안돼요~!',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Row profileArea() {
    return Row(
      children: [
        UserProfileImage(
            dimension: 50,
            imgUrl: 'https://picsu'
                'm.photos/200/300'),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오상구',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '온천동',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
