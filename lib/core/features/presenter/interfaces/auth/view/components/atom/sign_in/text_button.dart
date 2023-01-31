import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: const BorderSide(
            width: 2,
            color: Colors.cyan,
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}