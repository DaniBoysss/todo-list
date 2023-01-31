import 'package:equatable/equatable.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String data;

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.data,
  });

  static TaskModel fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'] as String? ?? '',
        title: json['title'] as String,
        description: json['description'] as String,
        data: json['data'] as String,
      );

  static Map<String, dynamic> toJson(TaskModel instance) => <String, dynamic>{
        'id': instance.id,
        'title': instance.title,
        'description': instance.description,
        'data': instance.data,
      };

  TaskEntity toEntity() => TaskEntity(
        id: id,
        title: title,
        description: description,
        data: data,
      );

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    data,
  ];
}
