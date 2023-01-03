import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorioModel.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorio_controller.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorio_form_widget.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:flutter/material.dart';

class CardRecordatorioWidget extends StatefulWidget {
  const CardRecordatorioWidget({Key? key, required this.recordatorioModel})
      : super(key: key);

  final RecordatorioModel recordatorioModel;

  @override
  State<CardRecordatorioWidget> createState() => _CardRecordatorioWidgetState();
}

class _CardRecordatorioWidgetState extends State<CardRecordatorioWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.recordatorioModel.toString());
    return Card(
      child: Padding(
        padding: EdgeInsets.all(paddingContainer()),
        child: Column(
          children: [
            Text(
              '${widget.recordatorioModel.nombre}',
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            Text('${widget.recordatorioModel.texto}'),
            Text(
                widget.recordatorioModel.isRecordatorio!
                    ? 'Activado'
                    : 'Desactivado',
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
            Text('${widget.recordatorioModel.fechaRecordatorio}',
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
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
                                  recordatorioModel: widget.recordatorioModel,
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
                                  recordatorioModel: widget.recordatorioModel,
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
                                title: Text(
                                    'Seguro que desea eliminar al usuario ${widget.recordatorioModel.nombre}'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () => RecordatorioController()
                                          .eliminarRecordatorio(
                                              widget.recordatorioModel)
                                          .then((value) {
                                            setState((){});
                                            Navigator.pop(context);
                                          }),
                                      child: const Text('SI, Eliminar')),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {

                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancelar'))
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
