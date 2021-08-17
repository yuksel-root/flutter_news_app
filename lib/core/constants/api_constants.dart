import 'package:flutter_news_app_with_api/models/news_categories.dart';
import 'package:flutter_news_app_with_api/models/news_country.dart';
import 'category_constants.dart';
import 'country_constants.dart';

class ApiConstants {
  static const String apiKey = '241e074b3c3945cf850407a246c8b648';
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String topHeadlines = 'top-headlines';

  List<NewsCategory>? getAllCategories() {
    final categories = CategoryConstants.listCategory;

    return categories
        .map((categories) => NewsCategory.fromJson(categories))
        .toList();
  }

  List<NewsCountry>? getAllCountries() {
    final countries = CountryConstants.listCountry;

    return countries
        .map((countries) => NewsCountry.fromJson(countries))
        .toList();
  }
}
