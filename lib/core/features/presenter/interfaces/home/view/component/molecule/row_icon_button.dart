import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/dialog_delete_task/delete_task_dialog.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/dialog_update_task/update_task_dialog.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_icon.dart';

class RowIconButton extends StatelessWidget {
  final TaskEntity taskEntity;

  const RowIconButton({
    Key? key,
    required this.taskEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIcon(
          icon: Icons.edit_outlined,
          onPressed: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animationOne, animationTwo) {
                return Container();
              },
              transitionBuilder: (context, animationOne, animationTwo, child) {
                var curve = Curves.easeInOut.transform(animationOne.value);
                return Transform.scale(
                  scale: curve,
                  child: UpdateTask(taskEntity: taskEntity),
                );
              },
              transitionDuration: const Duration(milliseconds: 500),
            );
          },
          iconColor: AppColors.secundaryColor,
        ),
        CustomIcon(
          onPressed: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animationOne, animationTwo) {
                return Container();
              },
              transitionBuilder: (context, animationOne, animationTwo, child) {
                var curve = Curves.easeInOut.transform(animationOne.value);
                return Transform.scale(
                  scale: curve,
                  child: DeleteTask(taskEntity: taskEntity),
                );
              },
              transitionDuration: const Duration(milliseconds: 500),
            );
          },
          iconColor: Colors.red.shade400,
          icon: Icons.delete,
        ),
      ],
    );
  }
}
