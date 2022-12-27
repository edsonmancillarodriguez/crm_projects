import 'package:crm_projects/app/routes.dart';
import 'package:crm_projects/log_in_out/log_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          buttonTheme: const ButtonThemeData(splashColor: Colors.greenAccent),
          iconTheme: const IconThemeData(
            color: Colors.blueAccent,
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.blueAccent,
            selectedColor: Colors.greenAccent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(

                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blueAccent),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green))),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.black54,
              onPrimary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.white54,
              error: Colors.redAccent,
              onError: Colors.red,
              background: Colors.transparent,
              onBackground: Colors.transparent,
              surface: Colors.blue,
              onSurface: Colors.blueAccent),
          primaryColorDark: Colors.black54),
      initialRoute: Login().routeName,
      routes: ListRoutes().routes,
    );
  }
}
