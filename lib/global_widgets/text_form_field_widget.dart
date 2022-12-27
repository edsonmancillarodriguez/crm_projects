import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key, this.label, this.keyboardType, this.maxLine, this.validator, this.controller, this.enabled}) : super(key: key);
  final String? label;
  final TextInputType? keyboardType;
  final int? maxLine;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        maxLines: maxLine,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          label: Text('$label'),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
      ),
    );
  }
}
