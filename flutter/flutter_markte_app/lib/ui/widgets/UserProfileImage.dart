import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final double dimension;
  final String imgUrl;

  const UserProfileImage({
    super.key,
    required this.dimension,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
