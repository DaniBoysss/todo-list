abstract class HttpAdapter {
  Future<dynamic> request({
    required String url,
    required String method,
    required Map? body,
    required Map? headers,
  });
}