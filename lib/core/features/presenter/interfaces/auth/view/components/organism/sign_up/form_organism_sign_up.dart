import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/molecules/sign_up/form_sign_up.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_container.dart';
import 'package:lista_tarefas/core/shareds/routes/app_routes.dart';

class FormOrganismSignUp extends StatefulWidget {
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

  const FormOrganismSignUp({
    Key? key,
    required this.formKey,
    required this.onPressed,
    required this.onSavedEmail,
    required this.onSavedNome,
    required this.onSavedPassword,
    required this.onSavedCelular,
    required this.phoneFormatter,
    required this.child,
    required this.validatorSenha,
    required this.validatorNome,
    required this.validatorCelular,
    required this.validatorEmail,
  }) : super(key: key);

  @override
  State<FormOrganismSignUp> createState() => _FormOrganismSignUpState();
}

class _FormOrganismSignUpState extends State<FormOrganismSignUp> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormSignUp(
            //FORMULÁRIO
            formKey: widget.formKey,
            onSavedEmail: widget.onSavedEmail,
            onSavedNome: widget.onSavedNome,
            onSavedPassword: widget.onSavedPassword,
            onSavedCelular: widget.onSavedCelular,
            phoneFormatter: widget.phoneFormatter,
            //BOTÃO
            onPressed: widget.onPressed,
            validatorEmail: widget.validatorEmail,
            validatorSenha: widget.validatorSenha,
            validatorCelular: widget.validatorCelular,
            validatorNome: widget.validatorNome,
            child: widget.child,
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              'Já tem cadastro ?',
              style: TextStyle(
                color: AppColors.secundaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(PagesRoutes.signInRoute);
            },
            child: const Text(
              'Clique aqui',
              style: TextStyle(
                  color: AppColors.secundaryColor,
                  fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
          ),
        ],
      ),
    );
  }
}
