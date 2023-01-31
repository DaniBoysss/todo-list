import 'package:flutter_test/flutter_test.dart';
import 'package:lista_tarefas/core/features/data/datasource/user_datasource_impl/user_datasource_impl.dart';
import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/features/presenter/entity/add_task_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

class MockHttpAdapter extends HttpAdapterImpl implements Mock {
  MockHttpAdapter(MockClient client) : super(client);
}

void main() {
  late MockClient client;
  late MockHttpAdapter httpAdapter;
  late UserDatasourceImpl datasourceImpl;

  setUpAll(
    () {
      client = MockClient();
      httpAdapter = MockHttpAdapter(client);
      datasourceImpl = UserDatasourceImpl(httpAdapter);
    },
  );

  group(
    'GET TASKS',
    () {
      test(
        'SUCCESS: should return a list of task',
        () async {
          //ARRANGE
          const temail = '';
          const tresponse =
              '[{"id":"HYEg0ABkdfJ1ikwrmLCq","title":"Tarefa ","completed":false,"data":"30/01/2023","description":"Descrição "}]';
          when(client)
              .calls(#get)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await datasourceImpl.getAllTasks(email: temail);
          //ASSERT
          expect(result.runtimeType, List<dynamic>);
          expect(result[0]['id'], 'HYEg0ABkdfJ1ikwrmLCq');
        },
      );

      test(
        'ERROR: should return a empty list',
        () async {
          //ARRANGE
          const temail = '';
          const tresponse = '[]';
          when(client)
              .calls(#get)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await datasourceImpl.getAllTasks(email: temail);
          //ASSERT
          expect(result.runtimeType, List<dynamic>);
          expect(result.isEmpty, true);
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
          final result = await datasourceImpl.addTask(
            email: temail,
            entity: tasks,
          );
          //ASSERT
          expect(result['message'], 'TASK CREATED SUCCESS');
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
          final result = await datasourceImpl.updateTask(
            email: temail,
            entity: tasks,
          );
          //ASSERT
          expect(result['message'], 'TASK UPDATED SUCCESS');
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
          final result = await datasourceImpl.updateTask(
            email: temail,
            entity: tasks,
          );
          //ASSERT
          expect(result['message'].runtimeType, String);
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
          final result = await datasourceImpl.deleteTask(
            idTask: idTask,
            email: temail,
          );
          //ASSERT
          expect(result['message'], 'TASK DELETE SUCCESS');
        },
      );
      /*NÃO FOI FEITO TESTE DE ERRO, POIS O BACKEND ESTÁ ACEITANDO TUDO*/
    },
  );
}
