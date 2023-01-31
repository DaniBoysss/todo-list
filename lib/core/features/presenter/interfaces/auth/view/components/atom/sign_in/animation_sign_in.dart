import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimationSignIn extends StatefulWidget {
  final double fontSize;

  const AnimationSignIn({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  @override
  State<AnimationSignIn> createState() => _AnimationSignInState();
}

class _AnimationSignInState extends State<AnimationSignIn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: widget.fontSize,
        ),
        child: AnimatedTextKit(
          pause: Duration.zero,
          repeatForever: true,
          animatedTexts: [
            FadeAnimatedText('Organize'),
            FadeAnimatedText('Programe'),
            FadeAnimatedText('Planeje'),
          ],
        ),
      ),
    );
  }
}
