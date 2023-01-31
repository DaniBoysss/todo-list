import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_tarefas/core/features/data/model/user/user_model.dart';
import '../../../../../fixtures/fixture.dart';

void main() {
  const tUserModel = UserModel(
    name: 'Daniel Blue',
    token: 'tokenUser123456',
    password: '12345678',
    email: 'daniel@gmail.com',
    phoneNumber: '19 9 8390-5572',
    id: 'C200',
  );

  group(
    'fromJson',
    () {
      test(
        'should return a valid model from json',
        () async {
          //arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('user_model.json'));
          print(jsonMap);

          //act
          final result = UserModel.fromJson(jsonMap);

          //assert
          expect(
            result,
            equals(tUserModel),
          );
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        'should return a JSON MAP containing a proper DATA',
        () async {
          //act
          final result = UserModel.toJson(tUserModel);

          //assert
          final expectJsonMap = {
            'name': 'Daniel Blue',
            'email': 'daniel@gmail.com',
            'phoneNumber': '19 9 8390-5572',
            'password': '12345678',
            'id': 'C200',
            'token': 'tokenUser123456'
          };
          expect(
            result,
            equals(expectJsonMap),
          );
        },
      );
    },
  );
}
