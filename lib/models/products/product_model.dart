import '../pagination/pagination.dart';

class ProductModel {
  final String status;
  final List<Product> data;
  final Pagination pagination;
  final String message;

  ProductModel({
    required this.status,
    required this.data,
    required this.pagination,
    required this.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'] ?? '',
      data: List<Product>.from(
        (json['data'] ?? []).map((item) => Category.fromJson(item)),
      ),
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
      message: json['message'] ?? '',
    );
  }
}

class Product {
  final String id;
  final String name;
  final List<String> images;
  final String description;
  final double salePrice;
  final double currentPrice;
  final double discountPercent;
  final DateTime discountStartDate;
  final DateTime discountEndDate;
  final Store store;
  final Category category;
  final Category subCategory;
  final Brand brand;
  final double? rating;
  final int visitCount;
  final int cartAddedCount;
  final int quantityAvailable;
  final String status;
  final String gender;
  final List<String> tags;

  Product({
    required this.id,
    required this.name,
    required this.images,
    required this.description,
    required this.salePrice,
    required this.currentPrice,
    required this.discountPercent,
    required this.discountStartDate,
    required this.discountEndDate,
    required this.store,
    required this.category,
    required this.subCategory,
    required this.brand,
    this.rating,
    required this.visitCount,
    required this.cartAddedCount,
    required this.quantityAvailable,
    required this.status,
    required this.gender,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      description: json['description'],
      salePrice: (json['salePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      discountPercent: (json['discountPercent'] as num).toDouble(),
      discountStartDate: DateTime.parse(json['discountStartDate']),
      discountEndDate: DateTime.parse(json['discountEndDate']),
      store: Store.fromJson(json['store']),
      category: Category.fromJson(json['category']),
      subCategory: Category.fromJson(json['subCategory']),
      brand: Brand.fromJson(json),
      rating:
          json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      visitCount: json['visitCount'],
      cartAddedCount: json['cartAddedCount'],
      quantityAvailable: json['quantityAvailable'],
      status: json['status'],
      gender: json['gender'],
      tags: List<String>.from(json['tags']),
    );
  }
}

class Store {
  final String id;
  final String name;

  Store({required this.id, required this.name});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(id: json['id'], name: json['name']);
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name']);
  }
}

class Brand {
  final String id;
  final String name;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['_id'], name: json['name']);
  }
}
