class ApiConstants {
  static const String apiKey = 'cafd035f5d764660adf678dfcf14b982'; //2
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String topHeadlines = 'top-headlines?country=';

  static const String defaultTopHeadlinesUrl =
      baseUrl + topHeadlines + 'tr&apiKey=$apiKey';

  static String headlinesFor(String country) {
    return baseUrl + topHeadlines + '$country&apiKey=$apiKey';
  }

  static String topHeadlinesForCategory(String country, String category) {
    return baseUrl +
        topHeadlines +
        '$country' +
        '&category=$category' +
        '&apiKey=$apiKey';
  }

  static const Map<String, dynamic> Countries = {
    "Turkey": "tr",
    "United States of America": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch"
  };

  static const Map<String, dynamic> Categories = {
    "General": "general",
    "Business": "business",
    "Technology": "technology",
    "Sports": "sports",
    "Health": "health",
    "Entertainment": "entertainment"
  };
}
