import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';

abstract class AuthDatasource {
  Future<Map<String, dynamic>> signInUser({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> signUpUser({required AuthEntity entity});
}