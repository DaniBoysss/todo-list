import 'package:lista_tarefas/core/features/domain/datasource/user_datasource/user_datasource.dart';
import 'package:lista_tarefas/core/features/domain/repository/user_repository/user_repository.dart';
import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasourceImpl;

  UserRepositoryImpl(this.datasourceImpl);

  @override
  Future<List> getAllTasks({required String email}) async {
    final response = await datasourceImpl.getAllTasks(email: email);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addTask({
    required AddTaskEntity entity,
    required String email,
  }) async {
    final response = await datasourceImpl.addTask(
      entity: entity,
      email: email,
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateTask({
    required AddTaskEntity entity,
    required String email,
  }) async {
    final response = await datasourceImpl.updateTask(
      entity: entity,
      email: email,
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteTask({
    required String idTask,
    required String email,
  }) async {
    final response = await datasourceImpl.deleteTask(
      idTask: idTask,
      email: email,
    );
    return response;
  }
}
