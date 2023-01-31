import 'package:flutter/material.dart';

class DividerSignIn extends StatelessWidget {
  const DividerSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'OU',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.withAlpha(250),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
