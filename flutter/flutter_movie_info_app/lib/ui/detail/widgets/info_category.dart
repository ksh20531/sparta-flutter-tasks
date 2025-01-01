import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/data/model/movie.dart';

class InfoCategory extends StatelessWidget {
  final Movie? movie;
  const InfoCategory({super.key, this.movie});

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
                '${movie!.genres![index].name}',
                style: TextStyle(color: Colors.blue),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 12);
          },
          itemCount: movie!.genres!.length),
    );
  }
}
