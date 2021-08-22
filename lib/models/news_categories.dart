class NewsCategory {
  final String? categoryName;
  final String? categoryCode;

  NewsCategory({this.categoryName, this.categoryCode});

  NewsCategory fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      categoryName: json['categoryName'] as String?,
      categoryCode: json['categoryCode'] as String?,
    );
  }
}
