import 'package:dio/dio.dart';
import 'package:flutter_app/configs/app_configs.dart';
import 'package:flutter_app/model/response/array_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
}
