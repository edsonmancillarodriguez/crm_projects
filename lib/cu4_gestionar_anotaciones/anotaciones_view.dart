import 'package:crm_projects/cu4_gestionar_anotaciones/anotaciones_form_widget.dart';
import 'package:crm_projects/cu4_gestionar_anotaciones/card_anotaciones_widget.dart';
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
        actions: [
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.person_add),
              onPressed: () async {
                //tiene que esperar el resultado del dialogo, y si es exitoso entonces actualiza la vista y muestra el snackBarMessage
                //si hay errores lo muestra en el snackBarMessage y no actualiza la vista
                await showDialog<String?>(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: AnotacionesFormWidget(
                        option: 'Registrar',
                      ),
                    );
                  },
                );
              },
              label: const Text('Nuevo Recordatorio'),
            ),
          ),
        ],
      ),
      drawer: MenuWidget(),
      body: Wrap(children: const [CardAnotacionesWidget()]),
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
