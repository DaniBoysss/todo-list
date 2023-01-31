import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/dialog_add_task/add_task_dialog.dart';

class FloatingButtonMolecule extends StatefulWidget {
  const FloatingButtonMolecule({Key? key}) : super(key: key);

  @override
  State<FloatingButtonMolecule> createState() => _FloatingButtonMoleculeState();
}

class _FloatingButtonMoleculeState extends State<FloatingButtonMolecule> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
              child: const AddTask(),
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
      child: Icon(
        Icons.add,
        color: AppColors.whiteColor,
        size: 34.0,
      ),
    );
  }
}
