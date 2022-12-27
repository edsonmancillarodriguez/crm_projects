import 'package:flutter/material.dart';

void showSnackBarWidget(
    {required BuildContext context, required String message, Color? color, bool? navigatorPop}) {
  (navigatorPop!=null && navigatorPop==true)?Navigator.pop(context, ''):null;
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}
