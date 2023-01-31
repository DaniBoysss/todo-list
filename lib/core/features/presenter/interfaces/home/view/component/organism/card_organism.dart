import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/expansion_tile_molecule.dart';

class CardOrganism extends StatelessWidget {
  final TaskEntity taskEntity;

  const CardOrganism({
    Key? key,
    required this.taskEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppColors.whiteColor,
        child: ExpansionTileMolecule(taskEntity: taskEntity),
      ),
    );
  }
}
