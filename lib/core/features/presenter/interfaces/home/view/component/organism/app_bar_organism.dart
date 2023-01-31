import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/icon_rotation_animation.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/app_name_widget.dart';
import 'package:flutter/material.dart';

class AppBarOrganism extends StatelessWidget {
  const AppBarOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconRotationAnimation(
          size: 20.0,
          color: AppColors.whiteColor,
        ),
        const SizedBox(width: 5),
        const AppNameWidget(),
      ],
    );
  }
}
