import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/mixin/mixin_views.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/splash/view/components/organism/splash_screen_organism.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_button.dart';
import 'package:lista_tarefas/core/shareds/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with MixinViews{

  @override
  void initState() {
    //INITIAIZED METHODS
    checkUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Bem-Vindo',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                const SplashScreenOrganism(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CustomButton(
                    onPressed: () {
                      Get.toNamed(PagesRoutes.signInRoute);
                    },
                    colorButton: AppColors.primaryColor,
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    sizeWidth: null,
                  ),
                ),
                Center(
                  child: Text(
                    'Não tem cadastro ?',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(PagesRoutes.signUpRoute);
                    },
                    child: Text(
                      'Clique aqui',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
