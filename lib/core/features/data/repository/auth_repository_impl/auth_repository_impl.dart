import 'package:lista_tarefas/core/features/domain/datasource/auth_datasource/auth_datasource.dart';
import 'package:lista_tarefas/core/features/domain/repository/auth_repository/auth_repository.dart';
import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasourceImpl;
  AuthRepositoryImpl(this.datasourceImpl);


  @override
  Future<Map<String, dynamic>> signInUser({
  required String email,
  required String password,
}) async {
    final response = await datasourceImpl.signInUser(password: password, email: email,);
    return response;
  }

  @override
  Future<Map<String, dynamic>> signUpUser({required AuthEntity entity}) async {
    final response = await datasourceImpl.signUpUser(entity: entity);
    return response;
  }

}