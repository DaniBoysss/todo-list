import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? sizeWidth;
  final void Function()? onPressed;
  final Color? colorButton;
  final Widget child;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.colorButton,
    required this.child,
    required this.sizeWidth
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.sizeWidth,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
