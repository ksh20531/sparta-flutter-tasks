class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          logoPath: map['logo_path'],
          name: map['name'],
          originCountry: map['origin_country'],
        );
}
