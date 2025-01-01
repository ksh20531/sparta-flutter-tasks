class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'] as int?,
          logoPath: map['logo_path'] as String?,
          name: map['name'] as String?,
          originCountry: map['origin_country'] as String?,
        );
}
