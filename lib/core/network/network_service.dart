import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/core/models/base_model.dart';
import 'dart:developer' as developer;

class NetworkService {
  static NetworkService? _instance;
  late Dio _dio;

  static NetworkService get instance {
    if (_instance == null) {
      _instance = NetworkService._init();
    }
    return _instance!;
  }

  NetworkService._init() {
    final apiKey = ApiConstants.apiKey;
    final baseOptions = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {"Authorization": "Bearer $apiKey"});
    _dio = Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper());
  }

  Future dioGet<T extends BaseModel>(String path, T model,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);

      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data['articles'];

          return responseBody;

        default:
          throw ("Failed to get news api throw");
      }
    } catch (e) {
      developer.log("Failed to get news api catch" + e.toString());
    }
  }
}
