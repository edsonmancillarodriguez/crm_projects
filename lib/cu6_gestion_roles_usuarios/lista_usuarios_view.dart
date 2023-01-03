import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class ListaUsuariosView extends StatelessWidget {
  final String routeName = 'ListaUsuraiosView';

  const ListaUsuariosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Usuarios View'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: const Center(child: Text('CU6 Gestion de Roles de Usuarios')),
    );
  }

  void cambiarRol(){
    throw UnimplementedError();

  }
}
