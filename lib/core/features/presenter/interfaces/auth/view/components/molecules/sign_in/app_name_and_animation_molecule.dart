import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/animation_sign_in.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/app_name_widget.dart';

class AppNameAndAnimationMolecules extends StatelessWidget {
  final double fontSize;

  const AppNameAndAnimationMolecules({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppNameWidget(),
          AnimationSignIn(
            fontSize: fontSize,
          )
        ],
      ),
    );
  }
}
