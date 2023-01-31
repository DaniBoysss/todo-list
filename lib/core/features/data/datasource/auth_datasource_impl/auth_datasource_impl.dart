import 'package:lista_tarefas/core/app/constants/endpoints/auth_endpoints/auth_endpoints.dart';
import 'package:lista_tarefas/core/features/domain/datasource/auth_datasource/auth_datasource.dart';
import 'package:lista_tarefas/core/features/domain/infra/adapter/http_adapter.dart';
import 'package:lista_tarefas/core/features/infra/methods/http_methods.dart';
import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpAdapter http;

  AuthDatasourceImpl(this.http);

  @override
  Future<Map<String, dynamic>> signInUser({
    required String email,
    required String password,
  }) async {
    final response = await http.request(
      url: AuthEndpoints.signInUser + '?email=$email&password=$password',
      method: HttpMethods.get,
      body: null,
      headers: {},
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> signUpUser({required AuthEntity entity}) async {
    final response = await http.request(
      url: AuthEndpoints.signUpUser,
      method: HttpMethods.post,
      body: {
        'name': entity.name,
        'email': entity.email,
        'password': entity.password,
        'phoneNumber': entity.phoneNumber,
      },
      headers: {},
    );
    return response;
  }
}
