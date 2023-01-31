import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';

class AppNameWidget extends StatelessWidget {

  const AppNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontSize: 30.0,
        ),
        children: [
          TextSpan(
            text: 'Active',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(
            text: 'Do',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}