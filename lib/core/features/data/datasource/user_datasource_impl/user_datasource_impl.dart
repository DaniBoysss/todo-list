import 'package:lista_tarefas/core/app/constants/endpoints/user_endpoints/user_endpoints.dart';
import 'package:lista_tarefas/core/features/domain/datasource/user_datasource/user_datasource.dart';
import 'package:lista_tarefas/core/features/domain/infra/adapter/http_adapter.dart';
import 'package:lista_tarefas/core/features/infra/methods/http_methods.dart';
import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';

class UserDatasourceImpl implements UserDatasource {
  final HttpAdapter http;

  UserDatasourceImpl(this.http);

  @override
  Future<List> getAllTasks({required String email}) async {
    final response = await http.request(
      url: UserEndpoints.getAllTasks + '?email=$email',
      method: HttpMethods.get,
      body: null,
      headers: {},
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> addTask({
    required AddTaskEntity entity,
    required String email,
  }) async {
    final response = await http.request(
      url: UserEndpoints.addTask,
      method: HttpMethods.post,
      body: {
        'title': entity.title,
        'description': entity.description,
        'data': entity.data,
        'completed': false,
        'email': email
      },
      headers: {},
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateTask({
    required AddTaskEntity entity,
    required String email,
  }) async {
    print(entity);
    final response = await http.request(
      url: UserEndpoints.updateTask,
      method: HttpMethods.patch,
      body: {
        'id': entity.id,
        'title': entity.title,
        'description': entity.description,
        'data': entity.data,
        'completed': false,
        'email': email
      },
      headers: {},
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteTask({
    required String idTask,
    required String email,
  }) async {
    final response = await http.request(
      url: UserEndpoints.deleteTask,
      method: HttpMethods.delete,
      body: {'id': idTask, 'email': email},
      headers: {},
    );
    return response;
  }
}
