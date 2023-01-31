import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/features/domain/entities/person_entity.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';

mixin MixinHomeController <T extends GetxController> {
  ValueNotifier isLoading$ = ValueNotifier(false);
  AddTaskEntity entity = AddTaskEntity();
  PersonEntity? personEntity;
  final taskEntity = RxList<TaskEntity>([]).obs;
}