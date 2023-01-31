import 'package:lista_tarefas/core/features/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:lista_tarefas/core/features/data/datasource/auth_datasource_impl/auth_datasource_impl.dart';
import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';
import 'package:lista_tarefas/core/features/domain/usecase/auth_usecase.dart';
import 'package:lista_tarefas/core/features/data/model/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

class MockHttpAdapter extends HttpAdapterImpl implements Mock {
  MockHttpAdapter(MockClient client) : super(client);
}

class MockDataSourceImpl extends AuthDatasourceImpl implements Mock {
  MockDataSourceImpl(MockHttpAdapter http) : super(http);
}

class MockRepositoryImpl extends AuthRepositoryImpl implements Mock {
  MockRepositoryImpl(MockDataSourceImpl datasourceImpl) : super(datasourceImpl);
}

void main() {
  late MockClient client;
  late MockHttpAdapter httpAdapter;
  late MockDataSourceImpl dataSourceImpl;
  late MockRepositoryImpl repositoryImpl;
  late AuthUsecase usecase;

  setUpAll(
    () {
      client = MockClient();
      httpAdapter = MockHttpAdapter(client);
      dataSourceImpl = MockDataSourceImpl(httpAdapter);
      repositoryImpl = MockRepositoryImpl(dataSourceImpl);
      usecase = AuthUsecase(repositoryImpl);
    },
  );

  group(
    'LOGIN',
    () {
      test(
        'ERROR: should return a message error',
        () async {
          //ARRANGE
          const tpassword = '123456';
          const temail = 'daniel@gmail.com';
          const tresponse = '{"message":"INVALID CREDENTIALS"}';

          when(client)
              .calls(#get)
              .thenAnswer((_) async => http.Response(tresponse, 200));
          //ACT
          final result = await usecase.callSignIn(
            email: temail,
            password: tpassword,
          );
          //ASSERT
          result.fold(
            (_) {},
            (failure) {
              expect(failure, 'Email e/ou senha inválidos.');
            },
          );
        },
      );
      test(
        'SUCCESS: should user data',
        () async {
          //ARRANGE
          const tpassword = '123456';
          const temail = 'daniel@gmail.com';
          const tresponse =
              '{"password":"lol@8547as345","name":"André Capelli","email":"andre2@hotmail.com","phoneNumber":"935884061"}';

          when(client)
              .calls(#get)
              .thenAnswer((_) async => http.Response(tresponse, 200));
          //ACT
          final result = await usecase.callSignIn(
            email: temail,
            password: tpassword,
          );
          //ASSERT
          result.fold(
            (success) {
              expect(success.runtimeType, UserModel);
              expect(success.name, 'André Capelli');
            },
            (_) {},
          );
        },
      );
    },
  );
  group(
    'CADASTRO',
    () {
      test(
        'ERROR: should return a message error',
        () async {
          //ARRANGE
          final tauthEntity = AuthEntity(
              name: "Capelli",
              email: "dan@gmal.com",
              password: "abc123456",
              phoneNumber: "99999999");
          const tresponse = '{"message":"SUCCESS"}';

          when(client)
              .calls(#post)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callSignUp(
            entity: tauthEntity,
          );
          //ASSERT
          result.fold(
            (_) {},
            (failure) {
              expect(failure.runtimeType, String);
              expect(failure, 'Email já registrado no banco de dados.');
            },
          );
        },
      );
      test(
        'SUCCESS: should return a message',
        () async {
          //ARRANGE
          final tauthEntity = AuthEntity(
              name: "Capelli",
              email: "dan@gmal.com",
              password: "abc123456",
              phoneNumber: "99999999");
          const tresponse = '{"message":"EMAIL ALREADY REGISTERED"}';

          when(client)
              .calls(#post)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callSignUp(
            entity: tauthEntity,
          );
          //ASSERT
          result.fold(
            (success) {
              expect(success.runtimeType, String);
              expect(success, 'Cadastro criado com sucesso!');
            },
            (_) {},
          );
        },
      );
    },
  );
}
