class SubCategoryModel {
  final String id;
  final String name;
  final List<String> images;
  final String icon;
  final bool isActive;
  final int productCount;
  final List<dynamic> parentCategory;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.images,
    required this.icon,
    required this.isActive,
    required this.productCount,
    required this.parentCategory,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['_id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      icon: json['icon'],
      isActive: json['isActive'],
      productCount: json['productCount'],
      parentCategory: json['subCategories'] ?? [],
    );
  }
}
