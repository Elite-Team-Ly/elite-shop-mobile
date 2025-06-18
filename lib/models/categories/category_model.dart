
import '../pagination/pagination.dart';

class CategoryModel {
  final String status;
  final List<Category> data;
  final Pagination pagination;
  final String message;

  CategoryModel({
    required this.status,
    required this.data,
    required this.pagination,
    required this.message,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      status: json['status'] ?? '',
      data: List<Category>.from(
          (json['data'] ?? []).map((item) => Category.fromJson(item))),
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
      message: json['message'] ?? '',
    );
  }


}

class Category {
  final String id;
  final String name;
  final List<String> images;
  final String icon;
  // final bool isActive;
  final int productCount;
  final List<dynamic> subCategories;

  Category({
    required this.id,
    required this.name,
    required this.images,
    required this.icon,
    // required this.isActive,
    required this.productCount,
    required this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      icon: json['icon'] ?? '',
      // isActive: json['isActive'] ?? false,
      productCount: json['productCount'] ?? 0,
      subCategories: List<dynamic>.from(json['subCategories'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'images': images,
    'icon': icon,
    // 'isActive': isActive,
    'productCount': productCount,
    'subCategories': subCategories,
  };
}









// import 'package:flutter/foundation.dart';
//
// class CategoryModel {
//   final String id;
//   final String name;
//   final List<String> images;
//   final String icon;
//   final bool isActive;
//   final int productCount;
//   final List<dynamic> subCategories;
//   final List<Pagination> pagination;
//
//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.images,
//     required this.icon,
//     required this.isActive,
//     required this.productCount,
//     required this.subCategories,
//     required this.pagination
//   });
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       id: json['_id'],
//       name: json['name'],
//       images: List<String>.from(json['images']),
//       icon: json['icon'],
//       isActive: json['isActive'],
//       productCount: json['productCount'],
//       subCategories: json['subCategories'] ?? [],
//       pagination: json['pagination']
//     );
//   }
// }
//
// class Pagination {
//   final int currentPage;
//   final int totalItems;
//   final int totalPages;
//   final int pageSize;
//
//   Pagination(
//       {required this.currentPage, required this.totalItems, required this.totalPages, required this.pageSize});
//
//   factory Pagination.fromjson(Map<String,dynamic> json){
//     return Pagination(
//         totalItems: json['pagination']['totalItems'],
//         currentPage: json['pagination']['currentPage'],
//         totalPages: json['pagination']['totalPages'],
//         pageSize: json['pagination']['pageSize']);
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
