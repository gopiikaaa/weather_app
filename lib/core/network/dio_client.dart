import 'package:dio/dio.dart';

class DioClient {
  DioClient()
    : _dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  final Dio _dio;

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
