import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/row_icon_button.dart';

class ExpansionTileMolecule extends StatelessWidget {
  final TaskEntity taskEntity;

  const ExpansionTileMolecule({
    Key? key,
    required this.taskEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        taskEntity.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const Icon(
        FontAwesomeIcons.barsProgress,
        color: Colors.black,
      ),
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  taskEntity.description,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                taskEntity.data,
                textAlign: TextAlign.start,
                style: const TextStyle(color: AppColors.secundaryHalfColor),
              ),
            ),
            RowIconButton(taskEntity: taskEntity)
          ],
        ),
      ],
    );
  }
}
