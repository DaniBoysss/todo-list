import 'package:lista_tarefas/core/features/infra/adapter/http_adapter_impl.dart';
import 'package:lista_tarefas/core/app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HttpAdapterImpl(http.Client()));
  runApp(const MyApp());
}



