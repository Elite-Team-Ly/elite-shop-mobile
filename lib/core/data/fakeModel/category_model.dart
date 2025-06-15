import 'package:flutter/material.dart';

class CategoryModel {
  final String iconName;
  final String title;

  CategoryModel({required this.iconName, required this.title});

  IconData get icon => _iconFromString(iconName);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(iconName: json['icon'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'icon': iconName, 'title': title};
  }

  static IconData _iconFromString(String iconName) {
    switch (iconName) {
      case 'chair_outlined':
        return Icons.chair_outlined;
      case 'headphones_outlined':
        return Icons.headphones_outlined;
      case 'directions_run':
        return Icons.directions_run;
      case 'pets':
        return Icons.pets;
      case 'checkroom':
        return Icons.checkroom;
      default:
        return Icons.help_outline;
    }
  }
}
