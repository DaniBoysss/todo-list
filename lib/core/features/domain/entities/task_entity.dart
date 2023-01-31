import 'package:equatable/equatable.dart';
import 'package:lista_tarefas/core/features/data/model/task/task_model.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String data;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.data,
  });

  static TaskEntity fromJson(TaskModel json) => TaskEntity(
    id: json.id,
    title: json.title,
    description: json.description,
    data: json.data,
  );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        data,
      ];
}
