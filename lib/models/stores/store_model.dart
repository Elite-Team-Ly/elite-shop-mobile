class StoreModel {
  final String id;
  final String name;
  final List<String> contactNumbers;
  final int productsCount;
  final String status;
  final double rating;
  final List<CategoryModel> categories;
  final List<String> images;
  final String logo;
  final LocationModel location;

  StoreModel({
    required this.id,
    required this.name,
    required this.contactNumbers,
    required this.productsCount,
    required this.status,
    required this.rating,
    required this.categories,
    required this.images,
    required this.logo,
    required this.location,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['_id'],
      name: json['name'],
      contactNumbers: List<String>.from(json['contactNumbers']),
      productsCount: json['productsCount'],
      status: json['status'],
      rating: (json['rating'] as num).toDouble(),
      categories:
          (json['categories'] as List)
              .map((cat) => CategoryModel.fromJson(cat))
              .toList(),
      images: List<String>.from(json['images']),
      logo: json['logo'],
      location: LocationModel.fromJson(json['location']),
    );
  }
}

class CategoryModel {
  final String id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['_id'], name: json['name']);
  }
}

class LocationModel {
  final String city;
  final String street;
  final double latitude;
  final double longitude;

  LocationModel({
    required this.city,
    required this.street,
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      city: json['city'],
      street: json['street'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
