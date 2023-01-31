import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/components/atom/sign_in/app_name_widget.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/animations/rotate_animation.dart';

class IconRotationAnimation extends StatelessWidget {
  final double size;
  final Color color;

  const IconRotationAnimation({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotateAnimation(
          child: Icon(
            FontAwesomeIcons.brain,
            size: size,
            color: color,
          ),
        ),
      ],
    );
  }
}
