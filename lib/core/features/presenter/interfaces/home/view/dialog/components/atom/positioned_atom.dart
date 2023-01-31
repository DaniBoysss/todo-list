import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionedAtom extends StatelessWidget {
  const PositionedAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.close),
      ),
    );
  }
}
