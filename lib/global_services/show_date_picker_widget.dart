import 'package:flutter/material.dart';

Future<DateTime?> showDatePickerWidget(
    {required BuildContext context,}) {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year+1));
}
