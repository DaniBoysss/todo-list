import 'package:get/get.dart';
import 'package:lista_tarefas/core/app/config/validator.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/controller/auth_controller.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/app_name_widget.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_up/icon_position.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/organism/sign_up/form_organism_sign_up.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_up/sign_up_text.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/mixin/mixin_views.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/icon_rotation_animation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin, MixinViews {
  //VARIAVEIS
  bool get _isLoading => controller.isLoading$.value;

  //FORMATTER
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  //INSTANCIA
  final controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    //INJECAO
    Get.find<AuthController>();

    //VALUENOTIFIER
    controller.isLoading$.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const IconPosition(),
                  Column(
                    children: [
                      IconRotationAnimation(
                        size: 100.0,
                        color: AppColors.whiteColor,
                      ),
                      const AppNameWidget(),
                    ],
                  ),
                  const SignUpText(),
                  FormOrganismSignUp(
                    formKey: formKey,
                    onSavedEmail: (value) {
                      controller.entity.email = value!;
                    },
                    onSavedNome: (value) {
                      controller.entity.name = value!;
                    },
                    onSavedPassword: (value) {
                      controller.entity.password = value!;
                    },
                    onSavedCelular: (value) {
                      controller.entity.phoneNumber = value!;
                    },
                    phoneFormatter: phoneFormatter,
                    onPressed: _isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              signUpUser(controller: controller);
                            }
                          },
                    validatorCelular: phoneValidator,
                    validatorNome: nameValidator,
                    validatorEmail: emailValidator,
                    validatorSenha: passwordValidator,
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              color: AppColors.whiteColor,
                            ),
                          )
                        : Text(
                            'Cadastrar usuário',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.whiteColor,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
