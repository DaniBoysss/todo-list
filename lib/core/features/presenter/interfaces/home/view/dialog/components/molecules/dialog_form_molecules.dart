import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_tarefas/core/app/config/validator.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_button.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_text_field.dart';

class DialogFormMolecules extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function(String?) onSavedTask;
  final void Function(String?) onSavedDescription;
  final void Function()? onPressed;
  final Widget child;

  const DialogFormMolecules({
    Key? key,
    required this.formKey,
    required this.onSavedTask,
    required this.onSavedDescription,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            onSaved: onSavedTask,
            icon: FontAwesomeIcons.barsProgress,
            label: 'Tarefa',
            validator: listaValidator,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            onSaved: onSavedDescription,
            icon: FontAwesomeIcons.barsProgress,
            label: 'Descrição',
            validator: listaValidator,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: onPressed,
            child: child,
            colorButton: AppColors.primaryColor,
            sizeWidth: null,
          ),
        ],
      ),
    );
  }
}
