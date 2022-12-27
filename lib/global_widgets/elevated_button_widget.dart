import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({Key? key, required this.onPressed, required this.label}) : super(key: key);
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
