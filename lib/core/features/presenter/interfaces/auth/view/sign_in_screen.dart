import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/organism/sign_in/form_organism_sign_in.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/controller/auth_controller.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/mixin/mixin_views.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/splash/view/components/organism/splash_screen_organism.dart';
import 'package:lista_tarefas/core/shareds/routes/app_routes.dart';
import 'package:lista_tarefas/core/app/config/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin, MixinViews {
  //INSTANCIA
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  //VARIAVEL
  bool get _isLoading => controller.isLoading$.value;

  @override
  void initState() {
    //INJECAO
    Get.find<AuthController>();



    //NOTIFIER
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
                children: [
                  const SplashScreenOrganism(),
                  FormOrganismSignIn(
                    formKey: formKey,
                    onSavedEmail: (value) {
                      controller.entity.email = value!;
                    },
                    onSavedPassword: (value) {
                      controller.entity.password = value!;
                    },
                    validatorPassword: passwordValidator,
                    validatorEmail: emailValidator,
                    onPressed: _isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              signInUser(
                                controller: controller,
                                password: passwordTEC.text,
                                email: emailTEC.text,
                              );
                            }
                          },
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
                            'Entrar',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.whiteColor,
                            ),
                          ),
                    onPressedText: () {
                      Get.toNamed(PagesRoutes.signUpRoute);
                    },
                    textButton: 'Cadastre-se',
                    emailController: emailTEC,
                    passwordController: passwordTEC,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
