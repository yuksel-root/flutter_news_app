import 'package:flutter_news_app_with_api/core/models/base_model.dart';

abstract class INetworkManager {
  Future dioGet<T extends BaseModel>(String path, T model,
      {Map<String, dynamic>? queryParameters});
}
