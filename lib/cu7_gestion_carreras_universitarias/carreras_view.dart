import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_model.dart';
import 'package:flutter/material.dart';

class CarrerasView extends StatelessWidget {
  final String routeName = 'CarrerasView';
  const CarrerasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carreras View'),
        centerTitle: true,
      ),
      drawer: const MenuWidget(),
      body: const Center(child: Text('CU7 Gestion Carreas Universitarias: CarrerasView')),
    );
  }

  void registrarCarrera(){
    throw UnimplementedError();

  }

  void actualizarCarrera(){
    throw UnimplementedError();

  }

  CarreraModel verCarrera(String id){
    throw UnimplementedError();

  }

  List<CarreraModel> listarCarreras(){
    throw UnimplementedError();

  }
}
