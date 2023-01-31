import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final Color iconColor;

  const CustomIcon({
    Key? key,
    required this.onPressed,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
