import '../pagination/pagination.dart';

class BrandModel {
  final String status;
  final List<Brand> data;
  final Pagination pagination;
  final String message;

  BrandModel({
    required this.status,
    required this.data,
    required this.pagination,
    required this.message,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      status: json['status'] ?? "",
      data: List<Brand>.from(
        (json['data'] ?? []).map((item) => Brand.fromJson(item)),
      ),
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
      message: json['message'],
    );
  }
}

class Brand {
  final String id;
  final String name;
  final List<String> images;
  final String logo;
  final String description;
  final List<String> url;
  final String phoneNumber;
  final String originType;
  final String createdAt;
  final String updatedAt;

  Brand({
    required this.id,
    required this.name,
    required this.images,
    required this.logo,
    required this.description,
    required this.url,
    required this.phoneNumber,
    required this.originType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      images: List<String>.from(json['images'] ?? []),
      logo: json['logo'] ?? "",
      description: json['description'] ?? "",
      url: List<String>.from(json['urls'] ?? []),
      phoneNumber: json['phoneNumber'] ?? "",
      originType: json['originType'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
    );
  }
}
