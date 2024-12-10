import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onSearch;
  final Function getGeolocation;

  HomePageAppBar({
    required this.onSearch,
    required this.getGeolocation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        onSubmitted: (value) {
          onSearch(value);
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            getGeolocation();
          },
          child: Container(
            width: 40,
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.gps_fixed),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
