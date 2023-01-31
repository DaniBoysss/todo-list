import 'package:lista_tarefas/core/app/config/service/utils_service.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/controller/auth_controller.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';
import 'package:lista_tarefas/core/shareds/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

mixin MixinViews<T extends StatefulWidget> on State<T> {


  Future<void> checkUserData() async {
    final result = await UtilService.getIdentity();
    if(result != null) {
      Get.offAllNamed(PagesRoutes.homeRoute);
    }
  }


  Future<void> signInUser({
    required AuthController controller,
    required String email,
    required String password,
  }) async {
    await controller.signInUser(
      email: email,
      password: password,
    );
  }

  Future<void> signUpUser({required AuthController controller}) async {
    await controller.signUpUser();
  }

  Future<void> addTask({required HomeController controller}) async {
    await controller.addTask();
  }

  Future<void> updateTask({
    required HomeController controller,
    required TaskEntity task,
  }) async {
    await controller.updateTask(task: task);
   }

  Future<void> deleteTask({
    required HomeController controller,
    required String idTask,
  }) async {
    await controller.deleteTask(idTask: idTask);
  }
}
