import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_model.dart';
import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_view.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorioModel.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorio_form_widget.dart';
import 'package:crm_projects/cu4_gestionar_anotaciones/card_anotaciones_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RecordatoriosView extends StatelessWidget {
  final String routeName = 'RecordatoriosView';

  const RecordatoriosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EstudianteModel? estudiante =
        ModalRoute.of(context)?.settings.arguments as EstudianteModel?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecordatoriosView'),
        centerTitle: true,
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
                      child: RecordatorioFormWidget(
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
      body: estudiante == null
          ? _isArgumentsNull(context)
          : _student(context, estudiante),
    );
  }

  void registrarRecordatorios() {
    throw UnimplementedError();
  }

  void actualizarRecordatorios() {
    throw UnimplementedError();
  }

  RecordatorioModel verRecordatorios() {
    throw UnimplementedError();
  }

  List<RecordatorioModel> listarRecordatorios() {
    throw UnimplementedError();
  }

  Widget _student(BuildContext context, EstudianteModel estudiante) {
    return ListView(
      children: [
        Card(
            child: Wrap(
          children: [
            Row(
              children: [
                const FlutterLogo(size: 150),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Nombre Completo: ',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  TextSpan(
                      text: '${estudiante.nombre!}\n',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87)),
                  const TextSpan(
                      text: 'Carnet de Identidad: ',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  TextSpan(
                      text: '${estudiante.dni!}\n',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87)),
                  const TextSpan(
                      text: 'Correo Electronico: ',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  TextSpan(
                      text: '${estudiante.correo!}\n',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87)),
                  const TextSpan(
                      text: 'Telefono: ',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  TextSpan(
                      text: '${estudiante.telefono!}\n',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87)),
                  const TextSpan(
                      text: 'Telefono de Referencia: ',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  TextSpan(
                      text: '${estudiante.refTelefono!}\n',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87)),
                ]))
              ],
            )
          ],
        )),
        Wrap(
          children: const [
            CardAnotacionesWidget(),
            CardAnotacionesWidget(),
            CardAnotacionesWidget(),
            CardAnotacionesWidget(),
            CardAnotacionesWidget(),
          ],
        ),
      ],
    );
  }

  Widget _isArgumentsNull(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
                text: 'CU3 Gestionar Recordatorios: Recordatorios Views\n'),
            TextSpan(
                text: 'Ups.. Algo esta mal en los argumentos.\n',
                style: Theme.of(context).textTheme.titleLarge),
            const TextSpan(text: 'Contacte al Departamento de desarrollo\n'),
            TextSpan(
              text: 'Click para volver al inicio...',
              style: const TextStyle(fontSize: 18, color: Colors.red),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      const EstudianteView().routeName,
                      (route) => false,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
