import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/mixin/mixin_home_page.dart';

class RotateAnimation extends StatefulWidget {
  final Widget child;

  const RotateAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<RotateAnimation> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with TickerProviderStateMixin, MixinHomePage {
  late Animation<double> animation;

  @override
  void initState() {
    //INITIALIZED ANIMATION
    controllerR = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    animation = Tween<double>(begin: 0.996, end: 1.004).animate(controllerR.view)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controllerR.reverse();
        }if (status == AnimationStatus.dismissed){
          controllerR.forward();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    controllerR.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: widget.child,
    );
  }
}
