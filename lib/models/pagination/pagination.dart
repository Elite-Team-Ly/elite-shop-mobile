class Pagination {
  final int currentPage;
  final int totalItems;
  final int totalPages;
  final int pageSize;

  Pagination({
    required this.currentPage,
    required this.totalItems,
    required this.totalPages,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalItems: json['totalItems'] ?? 0,
      currentPage: json['currentPage'] ?? 1,
      totalPages: json['totalPages'] ?? 1,
      pageSize: json['pageSize'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() => {
    'totalItems': totalItems,
    'currentPage': currentPage,
    'totalPages': totalPages,
    'pageSize': pageSize,
  };
}
