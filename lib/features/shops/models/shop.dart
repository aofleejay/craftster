class Shop {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  Shop({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    final location = json['location'];

    return Shop(
      id: json['id'],
      name: json['name'],
      latitude: location['latitude'],
      longitude: location['longitude'],
    );
  }
}
