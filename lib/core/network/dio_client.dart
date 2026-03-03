import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class DioClient{
  final Dio _dio;
   DioClient()
   : _dio =Dio(
    BaseOptions(baseUrl: ApiConstants.geoBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    ),
   );

Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {

      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response;

    } on DioException catch (e) {

      throw Exception(e.message);

    }
  }
}