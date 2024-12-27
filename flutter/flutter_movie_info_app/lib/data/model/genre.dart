class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          name: map['name'],
        );
}
