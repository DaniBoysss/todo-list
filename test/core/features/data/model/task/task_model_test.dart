import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_tarefas/core/features/data/model/task/task_model.dart';
import '../../../../../fixtures/fixture.dart';

void main() {
  const tTaskModel = TaskModel(
    id: '123456',
    title: 'Tarefa 1',
    description: 'Descricao 1',
    data: '30/01/2023',
  );

  group(
    'fromJson',
    () {
      test(
        'should return a valid model from json',
        () async {
          //arrange
          final Map<String, dynamic> jsonMap = json.decode(fixture('task_model.json'));
          //act
          final result = TaskModel.fromJson(jsonMap);
          //assert
          expect(
            result,
            equals(tTaskModel),
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
          final result = TaskModel.toJson(tTaskModel);

          //assert
          final expectJsonMap = {
            'id': '123456',
            'title': 'Tarefa 1',
            'description': 'Descricao 1',
            'data': '30/01/2023',
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
