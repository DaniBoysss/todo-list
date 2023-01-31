import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/divider.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/text_button.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/molecules/sign_in/form_sign_in.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_container.dart';

class FormOrganismSignIn extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String?)? validatorPassword;
  final String? Function(String?)? validatorEmail;
  final void Function(String?)? onSavedPassword;
  final void Function(String?)? onSavedEmail;
  final void Function()? onPressedText;
  final GlobalKey<FormState> formKey;
  final void Function()? onPressed;
  final String textButton;
  final Widget child;

  const FormOrganismSignIn({
    Key? key,
    required this.formKey,
    required this.onSavedEmail,
    required this.onSavedPassword,
    required this.onPressed,
    required this.onPressedText,
    required this.child,
    required this.textButton,
    required this.validatorEmail,
    required this.validatorPassword,
    required this.passwordController,
    required this.emailController,
  }) : super(key: key);

  @override
  State<FormOrganismSignIn> createState() => _FormOrganismSignInState();
}

class _FormOrganismSignInState extends State<FormOrganismSignIn> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormSignIn(
            validatorEmail: widget.validatorEmail,
            validatorPassword: widget.validatorPassword,
            formKey: widget.formKey,
            onSavedEmail: widget.onSavedEmail,
            onSavedPassword: widget.onSavedPassword,
            onPressed: widget.onPressed,
            passwordController: widget.passwordController,
            emailController: widget.emailController,
            child: widget.child,
          ),
          const SizedBox(height: 15),
          const DividerSignIn(),
          const SizedBox(height: 5),
          CustomTextButton(
            onPressed: widget.onPressedText,
            text: widget.textButton,
          ),
        ],
      ),
    );
  }
}
