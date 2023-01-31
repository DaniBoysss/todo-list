import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_icon.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconPosition extends StatelessWidget {
  const IconPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.centerLeft,
      child: CustomIcon(
        icon: Icons.arrow_back_ios,
        onPressed: () {
          Get.back();
        },
        iconColor: AppColors.whiteColor,
      ),
    );
  }
}
