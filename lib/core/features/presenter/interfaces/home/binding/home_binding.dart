import 'package:get/get.dart';
import 'package:lista_tarefas/core/features/data/datasource/user_datasource_impl/user_datasource_impl.dart';
import 'package:lista_tarefas/core/features/data/repository/user_repository_impl/user_repository_impl.dart';
import 'package:lista_tarefas/core/features/domain/usecase/user_usecase.dart';
import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDatasourceImpl(Get.find<HttpAdapterImpl>()),
      fenix: true,
    );
    Get.lazyPut(() => UserRepositoryImpl(Get.find<UserDatasourceImpl>()),
      fenix: true,
    );
    Get.lazyPut(() => UserUsecase(Get.find<UserRepositoryImpl>()),
      fenix: true,
    );
    Get.put(HomeController(Get.find<UserUsecase>()));
  }

}