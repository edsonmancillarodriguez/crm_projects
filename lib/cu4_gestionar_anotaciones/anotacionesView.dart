import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:crm_projects/cu4_gestionar_anotaciones/anotaciones_model.dart';
import 'package:flutter/material.dart';

class AnotacionesView extends StatelessWidget {
  final String routeName = 'AnotacionesView';

  const AnotacionesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnotacionesView'),
      ),
      drawer: const MenuWidget(),
      body: const Center(child: Text('CU4 gestionar anotaciones: anotaciones view')),
    );
  }
  void registrarAnotacion(){
    throw UnimplementedError();

  }

  AnotacionModel actualizarAnotacion(){
    throw UnimplementedError();

  }

  AnotacionModel verAnotacionNotas(){
    throw UnimplementedError();

  }

  List<AnotacionModel> listarAnotacion(){
    throw UnimplementedError();

  }
}
