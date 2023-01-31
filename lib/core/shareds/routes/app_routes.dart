import 'package:get/get.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/binding/auth_binding.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/sign_in_screen.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/sign_up_screen.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/binding/home_binding.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/home_screen.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/splash/view/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    //SPLASH
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    //AUTH
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => const SignInScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        AuthBinding(),
      ],
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => const SignUpScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        AuthBinding(),
      ],
    ),
    //HOME
    GetPage(
      name: PagesRoutes.homeRoute,
      page: () => const HomeScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      bindings: [
        HomeBinding(),
      ],
    )
  ];
}

abstract class PagesRoutes {
  //SPLASH
  static const String splashRoute ='/';
  //AUTH
  static const String signInRoute = '/sign_in';
  static const String signUpRoute = '/sign_up';
  //HOME
  static const String homeRoute = '/home';
}
