import 'package:flutter/material.dart';
import 'package:flutter_markte_app/core/snackbar_util.dart';
import 'package:flutter_markte_app/ui/widgets/UserProfileImage.dart';

class MyProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserProfileImage(
            dimension: 50,
            imgUrl: 'https://picsum'
                '.photos/200/300'),
        SizedBox(width: 10),
        Expanded(
            child: Text(
          '오상구',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        GestureDetector(
          onTap: () {
            SnackbarUtil.showSnackBar(context, '준비중입니다.');
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              '프로필 수정',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
