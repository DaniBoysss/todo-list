import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_button.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_text_field.dart';

class FormSignUp extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function()? onPressed;
  final void Function(String?)? onSavedEmail;
  final void Function(String?)? onSavedPassword;
  final void Function(String?)? onSavedNome;
  final void Function(String?)? onSavedCelular;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorSenha;
  final String? Function(String?)? validatorNome;
  final String? Function(String?)? validatorCelular;
  final TextInputFormatter phoneFormatter;
  final Widget child;

  const FormSignUp({
    Key? key,
    required this.formKey,
    required this.onPressed,
    required this.onSavedEmail,
    required this.onSavedNome,
    required this.onSavedPassword,
    required this.onSavedCelular,
    required this.phoneFormatter,
    required this.child,
    required this.validatorEmail,
    required this.validatorCelular,
    required this.validatorNome,
    required this.validatorSenha,
  }) : super(key: key);

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
            onSaved: widget.onSavedEmail,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: widget.validatorEmail,
          ),
          CustomTextField(
            icon: Icons.lock,
            label: 'Senha',
            onSaved: widget.onSavedPassword,
            isSecret: true,
            textInputAction: TextInputAction.next,
            validator: widget.validatorSenha,
          ),
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            onSaved: widget.onSavedNome,
            textInputAction: TextInputAction.next,
            validator: widget.validatorNome,
          ),
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            onSaved: widget.onSavedCelular,
            textInputType: TextInputType.phone,
            inputFormatters: [widget.phoneFormatter],
            textInputAction: TextInputAction.next,
            validator: widget.validatorCelular,
          ),
          CustomButton(
            colorButton: AppColors.primaryColor,
            onPressed: widget.onPressed,
            sizeWidth: null,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
