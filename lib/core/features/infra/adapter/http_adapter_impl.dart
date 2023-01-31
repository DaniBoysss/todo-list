import 'package:lista_tarefas/core/features/domain/infra/adapter/http_adapter.dart';
import 'package:lista_tarefas/core/features/infra/exceptions/http_failure.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HttpAdapterImpl implements HttpAdapter {
  final Client client;

  HttpAdapterImpl(this.client);

  @override
  Future request({
    required String url,
    required String method,
    required Map? body,
    required Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({'content-type': 'application/json'});

    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);

    Future<Response>? futureResponse;

    try {
      if (method == 'POST') {
        futureResponse = client.post(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      } else if (method == 'GET') {
        futureResponse = client.get(
          Uri.parse(url),
          headers: defaultHeaders,
        );
      } else if (method == 'PATCH') {
        futureResponse = client.patch(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      } else if (method == 'DELETE') {
        futureResponse = client.delete(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpFailure.serverError;
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpFailure.badRequest;
      case 401:
        throw HttpFailure.unauthorized;
      case 403:
        throw HttpFailure.forbidden;
      case 404:
        throw HttpFailure.notFound;
      default:
        throw HttpFailure.serverError;
    }
  }
}
