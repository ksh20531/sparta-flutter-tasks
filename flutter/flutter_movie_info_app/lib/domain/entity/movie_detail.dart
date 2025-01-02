import 'package:flutter_movie_info_app/data/model/genre.dart';
import 'package:flutter_movie_info_app/data/model/production_company.dart';

class MovieDetail {
  final int budget;
  final List<Genre>? genres;
  final int id;
  final List<ProductionCompany>? productionCompanies;
  final String overview;
  final double popularity;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  const MovieDetail({
    required this.budget,
    required this.genres,
    required this.id,
    required this.productionCompanies,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          releaseDate: DateTime.parse(map['release_date']),
          tagline: map['tagline'],
          runtime: map['runtime'],
          genres: map['genres'] != null
              ? (map['genres'] as List)
                  .map((genre) => Genre.fromJson(genre))
                  .toList()
              : null,
          overview: map['overview'],
          budget: map['budget'],
          popularity: map['popularity']?.toDouble(),
          productionCompanies: map['production_companies'] != null
              ? (map['production_companies'] as List)
                  .map((company) => ProductionCompany.fromJson(company))
                  .toList()
              : null,
          revenue: map['revenue'],
          voteAverage: map['vote_average']?.toDouble(),
          voteCount: map['vote_count'],
        );
}
