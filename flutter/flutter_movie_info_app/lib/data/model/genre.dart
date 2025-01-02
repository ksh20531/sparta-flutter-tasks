class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'] as int?,
          name: map['name'] as String?,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
