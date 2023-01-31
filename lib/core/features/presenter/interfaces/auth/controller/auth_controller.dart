import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lista_tarefas/core/features/data/model/user/user_model.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/controller/mixin/mixin_auth_controller.dart';
import 'package:lista_tarefas/core/features/domain/usecase/auth_usecase.dart';
import 'package:lista_tarefas/core/app/config/service/utils_service.dart';
import 'package:lista_tarefas/core/shareds/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with MixinAuthController {
  final AuthUsecase usecase;

  AuthController(this.usecase);

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    isLoading$.value = true;

    final result = await usecase.callSignIn(
      password: password,
      email: email,
    );

    isLoading$.value = false;

    result.fold(
      (data) async {
        final result = UserModel.toJson(data);
        final json = jsonEncode(result);
        await storage.write(
          key: 'userData',
          value: json,
        );
        Get.offAllNamed(PagesRoutes.homeRoute);
      },
      (failure) {
        UtilService.showToast(
          message: failure,
          isError: true,
        );
      },
    );
  }

  Future<void> signUpUser() async {
    isLoading$.value = true;

    final result = await usecase.callSignUp(entity: entity);

    isLoading$.value = false;

    result.fold(
      (message) {
        signInUser(
          email: entity.email,
          password: entity.password,
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
}
