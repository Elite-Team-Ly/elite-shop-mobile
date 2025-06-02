class CategoryModel {
  final String id;
  final String name;
  final List<String> images;
  final String icon;
  final bool isActive;
  final int productCount;
  final List<dynamic> subCategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.images,
    required this.icon,
    required this.isActive,
    required this.productCount,
    required this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      icon: json['icon'],
      isActive: json['isActive'],
      productCount: json['productCount'],
      subCategories: json['subCategories'] ?? [],
    );
  }
}
