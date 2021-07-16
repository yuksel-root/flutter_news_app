class ApiConstants {
  static const String API_KEY = 'cafd035f5d764660adf678dfcf14b982';
  static const String DEF_URL =
      'https://newsapi.org/v2/top-headlines?country=tr&apiKey=$API_KEY';

  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, dynamic> Countries = {
    "Turkey": "tr",
    "United States of America": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch"
  };
}
