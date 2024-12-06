import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/widgets/UserProfileImage.dart';

class ChatDetailReceiveItem extends StatelessWidget {
  final String imgUrl;
  final bool showProfile;
  final String content;
  final DateTime dateTime;

  ChatDetailReceiveItem({
    required this.imgUrl,
    required this.showProfile,
    required this.content,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showProfile
            ? UserProfileImage(dimension: 50, imgUrl: imgUrl)
            : SizedBox(width: 50),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                dateTime.toIso8601String(),
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}