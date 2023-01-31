import 'package:lista_tarefas/core/features/domain/repository/auth_repository/auth_repository.dart';
import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';
import 'package:lista_tarefas/core/features/infra/exceptions/http_error.dart';
import 'package:lista_tarefas/core/features/data/model/user/user_model.dart';
import 'package:result_dart/result_dart.dart';

class AuthUsecase {
  final AuthRepository repositoryImpl;

  AuthUsecase(this.repositoryImpl);

  Future<Result<UserModel, String>> callSignIn({
    required String email,
    required String password,
  }) async {
    final response = await repositoryImpl.signInUser(
      password: password,
      email: email,
    );
    if (response['message'] != null) {
      return Failure(HttpErrors.handleError(response['message']));
    } else {
      final result = UserModel.fromJson(response);
      return Success(result);
    }
  }

  Future<Result<String, String>> callSignUp(
      {required AuthEntity entity}) async {
    final response = await repositoryImpl.signUpUser(entity: entity);
    if (response['message'] == 'SUCCESS') {
      return Success(response['message']);
    } else {
      return Failure(HttpErrors.handleError(response['message']));
    }
  }
}
