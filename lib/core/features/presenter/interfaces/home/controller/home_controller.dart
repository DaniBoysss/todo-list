import 'package:intl/intl.dart';
import 'package:lista_tarefas/core/app/config/service/utils_service.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/domain/usecase/user_usecase.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/binding/home_binding.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/mixin/mixin_home_controller.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/home_screen.dart';

class HomeController extends GetxController with MixinHomeController {
  final UserUsecase usecase;

  HomeController(this.usecase);

  Future<void> getAllTasks({required String email}) async {
    isLoading$.value = true;

    final result = await usecase.callGet(email: email);

    isLoading$.value = false;

    result.fold(
      (tasks) {
        taskEntity.value =
            tasks.map((json) => TaskEntity.fromJson(json)).toList().obs;
      },
      (failure) {
        UtilService.showToast(
          message: failure,
          isError: true,
        );
      },
    );
  }

  Future<void> addTask() async {
    isLoading$.value = true;
    final user = await UtilService.getIdentity();
    entity.data = DateFormat("dd/MM/yyyy").format(DateTime.now());

    final result = await usecase.callAdd(
      entity: entity,
      email: user!.email,
    );

    isLoading$.value = false;

    result.fold(
      (message) {
        Get.offAll(
          const HomeScreen(),
          binding: HomeBinding(),
          arguments: message,
        );
      },
      (failure) {
        UtilService.showToast(
          message: failure,
          isError: true,
        );
      },
    );
  }

  Future<void> updateTask({required TaskEntity task}) async {
    isLoading$.value = true;
    entity.id = task.id;
    entity.data = task.data;
    final user = await UtilService.getIdentity();
    final result = await usecase.callUpdate(
      entity: entity,
      email: user!.email,
    );

    isLoading$.value = false;

    result.fold(
      (message) {
        Get.offAll(
          const HomeScreen(),
          binding: HomeBinding(),
          arguments: message,
        );
      },
      (failure) {
        UtilService.showToast(
          message: failure,
          isError: true,
        );
      },
    );
  }

  Future<void> deleteTask({required String idTask}) async {
    isLoading$.value = true;

    final user = await UtilService.getIdentity();
    final result = await usecase.callDelete(
      idTask: idTask,
      email: user!.email,
    );

    isLoading$.value = false;

    result.fold(
      (message) {
        Get.offAll(
          const HomeScreen(),
          binding: HomeBinding(),
          arguments: message,
        );
      },
      (failure) {
        UtilService.showToast(
          message: failure,
          isError: true,
        );
      },
    );
  }

  Future<void> getIdentity() async {
    final user = await UtilService.getIdentity();
    personEntity = user!.toEntity();
    getAllTasks(email: personEntity!.email);
  }

  @override
  void onInit() {
    getIdentity();
    super.onInit();
  }
}
