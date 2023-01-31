import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/animation_sign_in.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/app_name_widget.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/icon_rotation_animation.dart';

class SplashScreenOrganism extends StatelessWidget {
  const SplashScreenOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconRotationAnimation(
            size: 150.0,
            color: AppColors.whiteColor,
          ),
          const SizedBox(height: 10),
          const AppNameWidget(),
          const AnimationSignIn(fontSize: 25.0)
        ],
      ),
    );
  }
}
