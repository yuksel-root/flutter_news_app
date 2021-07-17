class ApiConstants {
  static const String API_KEY = 'cafd035f5d764660adf678dfcf14b982';

  static const String BASE_URL =
      'https://newsapi.org/v2/top-headlines?country=';
  static const String DEF_URL = BASE_URL + 'tr&apiKey=$API_KEY';

  static String headlinesFor(String country) {
    return BASE_URL + '$country&apiKey=$API_KEY';
  }

  static const Map<String, dynamic> Countries = {
    "Turkey": "tr",
    "United States of America": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch"
  };
}
