import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';

abstract class UserRepository {
  Future<List<dynamic>> getAllTasks({required String email});
  Future<Map<String, dynamic>> addTask({
    required AddTaskEntity entity,
    required String email,
  });
  Future<Map<String, dynamic>> updateTask({
    required AddTaskEntity entity,
    required String email,
  });
  Future<Map<String, dynamic>> deleteTask({
    required String idTask,
    required String email,
  });
}