class AdModel {
  final int id;
  final String image;
  final int productId;

  AdModel({required this.id, required this.image, required this.productId});

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      image: json['image'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'image': image, 'product_id': productId};
  }
}
