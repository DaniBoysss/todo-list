import 'package:flutter_test/flutter_test.dart';
import 'package:lista_tarefas/core/features/data/datasource/user_datasource_impl/user_datasource_impl.dart';
import 'package:lista_tarefas/core/features/data/model/task/task_model.dart';
import 'package:lista_tarefas/core/features/data/repository/user_repository_impl/user_repository_impl.dart';
import 'package:lista_tarefas/core/features/domain/usecase/user_usecase.dart';
import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

class MockHttpAdapter extends HttpAdapterImpl implements Mock {
  MockHttpAdapter(MockClient client) : super(client);
}

class MockDataSourceImpl extends UserDatasourceImpl implements Mock {
  MockDataSourceImpl(MockHttpAdapter http) : super(http);
}

class MockRepositoryImpl extends UserRepositoryImpl implements Mock {
  MockRepositoryImpl(MockDataSourceImpl datasourceImpl) : super(datasourceImpl);
}

void main() {
  late MockClient client;
  late MockHttpAdapter httpAdapter;
  late MockDataSourceImpl dataSourceImpl;
  late MockRepositoryImpl repositoryImpl;
  late UserUsecase usecase;

  setUpAll(
    () {
      client = MockClient();
      httpAdapter = MockHttpAdapter(client);
      dataSourceImpl = MockDataSourceImpl(httpAdapter);
      repositoryImpl = MockRepositoryImpl(dataSourceImpl);
      usecase = UserUsecase(repositoryImpl);
    },
  );

  group(
    'GET TASKS',
    () {
      test(
        'SUCCESS: should return a list of TaskModel',
        () async {
          //ARRANGE
          const temail = '';
          const tresponse =
              '[{"id":"HYEg0ABkdfJ1ikwrmLCq","title":"Tarefa ","completed":false,"data":"30/01/2023","description":"Descrição "}]';
          when(client)
              .calls(#get)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callGet(email: temail);

          //ASSERT
          result.fold(
            (data) {
              expect(data.runtimeType, List<TaskModel>);
              expect(data[0].id, 'HYEg0ABkdfJ1ikwrmLCq');
              expect(data[0].title, 'Tarefa ');
              expect(data[0].description, 'Descrição ');
              expect(data[0].data, '30/01/2023');
            },
            (_) {},
          );
        },
      );

      test(
        'ERROR: should return a message',
        () async {
          //ARRANGE
          const temail = '';
          const tresponse = '[]';
          when(client)
              .calls(#get)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callGet(email: temail);
          //ASSERT
          result.fold(
            (_) {},
            (failure) {
              expect(failure.runtimeType, String);
              expect(failure, 'Você não tem tarefas ainda.');
            },
          );
        },
      );
    },
  );

  group(
    'ADD TASK',
    () {
      test(
        'SUCCESS: should return a message',
        () async {
          //ARRANGE
          const temail = '';
          final tasks = AddTaskEntity();
          const tresponse = '{"message":"TASK CREATED SUCCESS"}';
          when(client)
              .calls(#post)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callAdd(
            email: temail,
            entity: tasks,
          );
          //ASSERT
          result.fold(
            (message) {
              expect(message.runtimeType, String);
              expect(message, 'Tarefa criada com sucesso!');
            },
            (_) {},
          );
        },
      );
      /*NÃO FIZ TESTE DE ERRO, POIS O BACKEND NÃO TINHA RETORNOS PARA ERROS, APENAS CASO FALTE ALGUM CAMPO, O QUE NÃO
      IRIA OCORRER, POIS É FEITO A TRATATIVA NO FRONT PARA EVITAR ENVIOS DE CAMPOS VAZIOS.*/
    },
  );

  group(
    'UPDATE TASK',
    () {
      test(
        'SUCCESS: should return a message',
        () async {
          //ARRANGE
          const temail = '';
          final tasks = AddTaskEntity();
          const tresponse = '{"message":"TASK UPDATED SUCCESS"}';
          when(client)
              .calls(#patch)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callUpdate(
            email: temail,
            entity: tasks,
          );
          //ASSERT
          result.fold(
            (message) {
              expect(message.runtimeType, String);
              expect(message, 'Tarefa atualizada com sucesso!');
            },
            (_) {},
          );
        },
      );

      /*ESSE TESTE DE ERRO DEVERIA SER PARA QUANDO USUÁRIO ENVIAR ID DA TASK ERRADO, PORÉM A MENSAGEM DE RESPOSTA DO BACK
      ESTÁ GENERICA*/

      test(
        'ERROR: should return a message',
        () async {
          //ARRANGE
          const temail = '';
          final tasks = AddTaskEntity();
          const tresponse =
              '{"message":"5 NOT_FOUND: No document to update: projects/flutter-daniboys/databases/(default)/documents/users/dani@hotmail.com/tasks/A3mNeajMFcV49CZwnV3g"}';
          when(client)
              .calls(#patch)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callUpdate(
            email: temail,
            entity: tasks,
          );
          //ASSERT
          result.fold(
            (_) {},
            (failure) {
              expect(failure.runtimeType, String);
              expect(failure, 'Essa tarefa NÃO consta nessa conta!');
            },
          );
        },
      );
    },
  );

  group(
    'DELETE TASK',
    () {
      test(
        'SUCCESS: should return a message',
        () async {
          //ARRANGE
          const temail = '';
          const idTask = '';
          const tresponse = '{"message":"TASK DELETE SUCCESS"}';
          when(client)
              .calls(#delete)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await usecase.callDelete(
            idTask: idTask,
            email: temail,
          );
          //ASSERT
          result.fold(
            (message) {
              expect(message.runtimeType, String);
              expect(message, 'Tarefa deletada com sucesso!');
            },
            (_) {},
          );
        },
      );
      /*NÃO FOI FEITO TESTE DE ERRO, POIS O BACKEND ESTÁ ACEITANDO TUDO*/
    },
  );
}
