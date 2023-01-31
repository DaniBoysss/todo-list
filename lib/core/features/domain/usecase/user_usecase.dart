import 'package:lista_tarefas/core/features/domain/repository/user_repository/user_repository.dart';
import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';
import 'package:lista_tarefas/core/features/infra/exceptions/http_error.dart';
import 'package:lista_tarefas/core/features/data/model/task/task_model.dart';
import 'package:result_dart/result_dart.dart';

class UserUsecase {
  final UserRepository repositoryImpl;

  UserUsecase(this.repositoryImpl);

  Future<Result<List<TaskModel>, String>> callGet({required String email}) async {
    final response = await repositoryImpl.getAllTasks(email: email);

    if (response.isNotEmpty) {
      List<TaskModel> tasksList =
          response.map((json) => TaskModel.fromJson(json)).toList();
      return Success(tasksList);
    } else {
      return const Failure('Você não tem tarefas ainda.');
    }
  }

  Future<Result<String, String>> callAdd({
    required AddTaskEntity entity,
    required String email,
  }) async {
    final response = await repositoryImpl.addTask(
      entity: entity,
      email: email,
    );

    if (response['message'] == 'TASK CREATED SUCCESS') {
      return Success(HttpErrors.handleError(response['message']));
    } else {
      return const Failure('Não foi possivel criar a tarefa.');
    }
  }

  Future<Result<String, String>> callUpdate({
    required AddTaskEntity entity,
    required String email,
  }) async {
    final response = await repositoryImpl.updateTask(
      entity: entity,
      email: email,
    );
    if (response['message'] == 'TASK UPDATED SUCCESS') {
      return Success(HttpErrors.handleError(response['message']));
    } else {
      return const Failure('Essa tarefa NÃO consta nessa conta!');
    }
  }

  Future<Result<String, String>> callDelete({
    required String idTask,
    required String email,
  }) async {
    final response = await repositoryImpl.deleteTask(
      idTask: idTask,
      email: email,
    );

    if (response['message'] == 'TASK DELETED SUCCESS') {
      return Success(HttpErrors.handleError(response['message']));
    } else {
      return const Failure('Não foi possivel deletar a tarefa!');
    }
  }
}
