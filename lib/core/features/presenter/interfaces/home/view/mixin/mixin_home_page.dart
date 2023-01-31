import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher_string.dart';

mixin MixinHomePage<T extends StatefulWidget> on State<T> {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late AnimationController controllerR;

  Future<void> launchURL(int i) async {
    var instagram = "https://www.instagram.com/_daniboysss/?next=%2F";
    var linkedin = "https://www.linkedin.com/in/daniel-oliveira-40a401169/";

    if (i == 1) {
      if (await canLaunchUrlString(instagram)) {
        launchUrlString(instagram);
      }
    } else if (i == 2) {
      if (await canLaunchUrlString(linkedin)) {
        launchUrlString(linkedin);
      }
    }
  }
}
