import 'package:flutter/material.dart';

class EstudiantesPorCarrerasView extends StatelessWidget {
  final String routeName = 'EstudiantesPorCarrerasView';
  const EstudiantesPorCarrerasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudiantes por Carreras'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Estudiantes por cada carrera')),
    );
  }
}
