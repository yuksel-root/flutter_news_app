class ApiConstants {
  static const String apiKey = 'cafd035f5d764660adf678dfcf14b982';
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
}
