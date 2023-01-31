import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/features/presenter/entity/auth_entity.dart';

mixin MixinAuthController <T extends GetxController> {
  final isLoading$ = ValueNotifier(false);
  AuthEntity entity = AuthEntity();
}