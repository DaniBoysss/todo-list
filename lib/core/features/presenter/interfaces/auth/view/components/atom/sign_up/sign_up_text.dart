import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'Cadastro',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
