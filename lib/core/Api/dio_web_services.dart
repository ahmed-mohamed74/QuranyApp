import 'package:dio/dio.dart';

import 'Errors/server_exception.dart';
import 'web_services.dart';

class DioWebServices extends WebServices {
  Dio dio;

  String kBaseUrl = 'https/google.com';
  DioWebServices(this.dio) {
    final options = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );
    dio = Dio(options);
  }

  @override
  Future get(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters}) async {
    try {
      final response = await dio.get(path);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future delete(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters}) async {
    try {
      final response = await dio.delete(path);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters}) async {
    try {
      final response = await dio.post(path);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> put(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters}) async {
    try {
      final response = await dio.put(path);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
