import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorio_controller.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorio_form_widget.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:flutter/material.dart';

class CardRecordatorioWidget extends StatelessWidget {
  const CardRecordatorioWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(paddingContainer()),
        child: Column(
          children: [
            const Text('Nombre', style: TextStyle(fontSize: 18, color: Colors.blueGrey),),
            const Text('Texto Descripcion'),
            const Text('Recordatorio activo true o false',style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
            const Text('Fecha de alarma',style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              child: Wrap(
                spacing: 30,
                children: [
                  Tooltip(
                    message: 'Editar Recordatorio',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: RecordatorioFormWidget(
                                  option: 'Actualizar',
                                  recordatorioModel: RecordatorioController().verRecordatorios(),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                  Tooltip(
                    message: 'Ver Informacion Completa',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: RecordatorioFormWidget(
                                  option: 'Ver',
                                  recordatorioModel: RecordatorioController().verRecordatorios(),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                  ),
                  Tooltip(
                    message: 'Eliminar Recordatorio',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Seguro que desea eliminar al usuario ${(RecordatorioController().verRecordatorios()).nombre}'),
                                actions: [
                                  ElevatedButton(onPressed: (){}, child: const Text('SI, Eliminar')),
                                  ElevatedButton(onPressed: ()=>Navigator.pop(context), child: const Text('Cancelar'))
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete_forever)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
