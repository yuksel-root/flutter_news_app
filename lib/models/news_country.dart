class NewsCountry {
  final String? countryName;
  final String? countryCode;
  final String? countryImage;
  NewsCountry({this.countryName, this.countryCode, this.countryImage});

  NewsCountry fromJson(Map<String, dynamic> json) {
    return NewsCountry(
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      countryImage: json['countryImage'] as String?,
    );
  }
}
