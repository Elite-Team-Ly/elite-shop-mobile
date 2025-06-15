import 'dart:async';

import 'package:flutter/material.dart';
import 'fakeModel/ad_model.dart';
import 'fakeModel/category_model.dart';

class FakeApiService {
  static Future<List<AdModel>> fetchAds() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> fakeJsonData = [
      {
        "id": 1,
        "image": "https://i.ibb.co/Df2NjTbs/AD1.png",
        "product_id": 101,
      },
      {
        "id": 2,
        "image": "https://i.ibb.co/mrF7Z90j/AD2.png",
        "product_id": 102,
      },
      {
        "id": 3,
        "image": "https://i.ibb.co/ycj84J2v/AD3.png",
        "product_id": 103,
      },
    ];

    return fakeJsonData.map((json) => AdModel.fromJson(json)).toList();
  }

  static Future<List<CategoryModel>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> fakeJsonData = [
      {"icon": "chair_outlined", "title": "أثاث"},
      {"icon": "headphones_outlined", "title": "إلكترونيات"},
      {"icon": "directions_run", "title": "رياضة"},
      {"icon": "pets", "title": "حيوانات أليفة"},
      {"icon": "checkroom", "title": "ملابس"},
    ];

    return fakeJsonData.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
