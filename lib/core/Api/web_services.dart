abstract class WebServices {
  Future<dynamic> get(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters});
  Future<dynamic> post(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters});
  Future<dynamic> put(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters});
  Future<dynamic> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParmemters});
}
