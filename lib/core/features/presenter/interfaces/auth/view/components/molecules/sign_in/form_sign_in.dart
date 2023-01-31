import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_button.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_text_field.dart';
import 'package:flutter/material.dart';

class FormSignIn extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(String?)? onSavedEmail;
  final void Function(String?)? onSavedPassword;
  final String? Function(String?)? validatorPassword;
  final String? Function(String?)? validatorEmail;
  final void Function()? onPressed;
  final Widget child;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const FormSignIn({
    Key? key,
    required this.formKey,
    required this.onSavedEmail,
    required this.onSavedPassword,
    required this.onPressed,
    required this.child,
    required this.validatorEmail,
    required this.validatorPassword,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            textInputType: TextInputType.emailAddress,
            icon: Icons.email,
            label: 'Email',
            onSaved: widget.onSavedEmail,
            validator: widget.validatorEmail,
            textInputAction: TextInputAction.next,
            controller: widget.emailController,
          ),
          CustomTextField(
            textInputType: TextInputType.visiblePassword,
            icon: Icons.lock,
            label: 'Senha',
            isSecret: true,
            onSaved: widget.onSavedPassword,
            validator: widget.validatorPassword,
            textInputAction: TextInputAction.done,
            controller: widget.passwordController,
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
