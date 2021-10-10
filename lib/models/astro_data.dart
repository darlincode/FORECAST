class AstroData {
  final Map<String, dynamic> location;
  final Map<String, dynamic> astronomy;

  AstroData(
    this.location,
    this.astronomy,
  );

  factory AstroData.fromJson(Map<String, dynamic> json) {
    return AstroData(
      json['location'],
      json['astronomy'],
    );
  }
}
