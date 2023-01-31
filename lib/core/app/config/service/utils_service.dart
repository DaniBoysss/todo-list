import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lista_tarefas/core/features/data/model/user/user_model.dart';

class UtilService {

  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<UserModel?> getIdentity() async {
    UserModel? userModel;
    final result = await storage.read(key: 'userData');
    if(result != null) {
      final jsonResult = jsonDecode(result);
      userModel = UserModel.fromJson(jsonResult);
      return userModel;
    }
    return userModel;
  }

  static void showToast({
    required String message,
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14,
    );
  }
}