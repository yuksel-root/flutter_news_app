class NewsCategory {
  final String? categoryName;
  final String? categoryCode;

  NewsCategory({required this.categoryName, required this.categoryCode});

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      categoryName: json['categoryName'] as String?,
      categoryCode: json['categoryCode'] as String?,
    );
  }
}
