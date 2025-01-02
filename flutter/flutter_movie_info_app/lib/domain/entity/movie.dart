class Movie {
  final int id;
  final String posterPath;

  const Movie({
    required this.id,
    required this.posterPath,
  });

  Movie.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          posterPath: map['poster_path'],
        );
}
