class CityModel {
  final String status;
  final String message;
  final List<City> data;

  CityModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: List<City>.from(
        (json['data'] ?? []).map((item) => City.fromJson(item)),
      ),
    );
  }
}

class City {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String status;

  City({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: json['status'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
    };
  }
}
