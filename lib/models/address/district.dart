class DistrictModel{
  final String status;
  final String message;
  final List<District> data;

  DistrictModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: List<District>.from(
        (json['data'] ?? []).map((item) => District.fromJson(item)),
      ),
    );
  }
}

class District {
  final String id;
  final String name;
  final DistrictCity city;
  final String status;

  District({
    required this.id,
    required this.name,
    required this.city,
    required this.status,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      city: DistrictCity.fromJson(json['city'] ?? {}),
      status: json['status'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
'city':city.toJson(),
      'status': status,
    };
  }
}

class DistrictCity {
  final String id;
  final String name;

  DistrictCity({
    required this.id,
    required this.name,
  });

  factory DistrictCity.fromJson(Map<String, dynamic> json) {
    return DistrictCity(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id':id,
      'name':name
    };
  }
}
