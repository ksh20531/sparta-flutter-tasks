import 'package:flutter_movie_info_app/data/model/genre.dart';
import 'package:flutter_movie_info_app/data/model/production_company.dart';

class Movie {
  int? id;
  String? posterPath;
  String? originalTitle;
  DateTime? releaseDate;
  String? tagline;
  int? runtime;
  List<Genre>? genres;
  String? overview;
  int? budget;
  double? popularity;
  List<ProductionCompany>? productionCompanies;
  int? revenue;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.id,
    this.posterPath,
    this.originalTitle,
    this.releaseDate,
    this.tagline,
    this.runtime,
    this.genres,
    this.overview,
    this.budget,
    this.popularity,
    this.productionCompanies,
    this.revenue,
    this.voteAverage,
    this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          posterPath: map['poster_path'],
          originalTitle: map['original_title'],
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
