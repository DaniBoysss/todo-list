import 'package:lista_tarefas/core/features/data/datasource/auth_datasource_impl/auth_datasource_impl.dart';
import 'package:lista_tarefas/core/features/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/controller/auth_controller.dart';
import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/features/domain/usecase/auth_usecase.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDatasourceImpl(Get.find<HttpAdapterImpl>()),
      fenix: true,
    );
    Get.lazyPut(() => AuthRepositoryImpl(Get.find<AuthDatasourceImpl>()),
      fenix: true,
    );
    Get.lazyPut(() => AuthUsecase(Get.find<AuthRepositoryImpl>()),
      fenix: true,
    );
    Get.put(AuthController(Get.find<AuthUsecase>()));
  }
}
