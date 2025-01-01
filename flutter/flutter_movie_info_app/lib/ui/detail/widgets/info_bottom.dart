import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/data/model/movie.dart';

class InfoBottom extends StatelessWidget {
  final Movie? movie;
  const InfoBottom({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    List<String> infoList = [
      '${movie!.voteAverage}\n평점',
      '${movie!.voteCount}\n평점투표수',
      '${movie!.popularity}\n인기점수',
      '\$${movie!.budget}\n예산',
      '\$${movie!.revenue}\n수익',
    ];

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
                  infoList[index],
                  textAlign: TextAlign.center,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: infoList.length,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                color: Colors.white,
                child: movie!.productionCompanies?[index].logoPath != null
                    ? Image.network(
                        'https://www.themoviedb.org/t/p/w500/${movie!.productionCompanies?[index].logoPath}',
                        fit: BoxFit.fitHeight,
                      )
                    : SizedBox.shrink(),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: movie!.productionCompanies!.length,
          ),
        ),
      ],
    );
  }
}
