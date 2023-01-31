import 'package:flutter_test/flutter_test.dart';
import 'package:lista_tarefas/core/features/data/datasource/auth_datasource_impl/auth_datasource_impl.dart';
import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

class MockHttpAdapter extends HttpAdapterImpl implements Mock {
  MockHttpAdapter(MockClient client) : super(client);
}

void main() {
  //INSTANCIAS TARDIAS
  late MockClient client;
  late MockHttpAdapter httpAdapter;
  late AuthDatasourceImpl datasourceImpl;

  //INICIANDO INSTANCIAS
  setUpAll(() {
    client = MockClient();
    httpAdapter = MockHttpAdapter(client);
    datasourceImpl = AuthDatasourceImpl(httpAdapter);
  });

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
          final result = await datasourceImpl.signInUser(
            email: temail,
            password: tpassword,
          );
          //ASSERT
          expect(
            result['message'],
            'INVALID CREDENTIALS',
          );
        },
      );
      test(
        'SUCCESS: should return user data',
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
          final result = await datasourceImpl.signInUser(
            email: temail,
            password: tpassword,
          );
          //ASSERT
          expect(result['name'], 'André Capelli');
          expect(result['phoneNumber'], '935884061');
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
          const tresponse = '{"message":"EMAIL ALREADY REGISTERED"}';

          when(client)
              .calls(#post)
              .thenAnswer((_) async => http.Response(tresponse, 200));

          //ACT
          final result = await datasourceImpl.signUpUser(
            entity: tauthEntity,
          );
          //ASSERT
          expect(
            result['message'],
            'EMAIL ALREADY REGISTERED',
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
          const tresponse = '{"message":"SUCCESS"}';

          when(client)
              .calls(#post)
              .thenAnswer((_) async => http.Response(tresponse, 200));
          //ACT
          final result = await datasourceImpl.signUpUser(entity: tauthEntity);
          //ASSERT
          expect(result['message'], 'SUCCESS');
        },
      );
    },
  );
}
