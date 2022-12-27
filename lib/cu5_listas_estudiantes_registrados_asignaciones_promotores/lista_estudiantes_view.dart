import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class ListaEstudiantesView extends StatelessWidget {
  final String routeName = 'ListaEstudiantesView';
  const ListaEstudiantesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Lista Estudiantes View'),
        centerTitle: true,
      ),
      drawer: const MenuWidget(),
      body: const Center(child: Text('CU5 listas de estudaintes registrados y asignaciones a promotores')),
    );
  }

  void asignar(){
    throw UnimplementedError();

  }
}
