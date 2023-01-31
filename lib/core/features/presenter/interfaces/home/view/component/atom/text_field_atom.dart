import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';

class TextFieldAtom extends StatefulWidget {
  final IconData icon;
  final String label;

  const TextFieldAtom({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  State<TextFieldAtom> createState() => _TextFieldAtomdState();
}

class _TextFieldAtomdState extends State<TextFieldAtom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black,
            size: 24.0,
          ),
          suffixIcon: IconButton(
            color: AppColors.primaryColor,
            iconSize: 34.0,
            onPressed: () {
              print('cliquei');
            },
            icon: const Icon(Icons.search),
          ),
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
