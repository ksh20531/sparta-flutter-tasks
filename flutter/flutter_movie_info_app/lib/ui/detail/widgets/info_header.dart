import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/data/model/movie.dart';
import 'package:intl/intl.dart';

class InfoHeader extends StatelessWidget {
  final Movie? movie;
  const InfoHeader({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${movie!.originalTitle}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(movie!.releaseDate!),
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '${movie!.tagline}',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Text(
            '${movie!.runtime}분',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
