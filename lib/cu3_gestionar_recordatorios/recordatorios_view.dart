import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_model.dart';
import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_view.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/card_recordatorio_widget.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorioModel.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorio_form_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RecordatoriosView extends StatefulWidget {
  final String routeName = 'RecordatoriosView';

  const RecordatoriosView({
    Key? key,
  }) : super(key: key);

  @override
  State<RecordatoriosView> createState() => _RecordatoriosViewState();
}

class _RecordatoriosViewState extends State<RecordatoriosView> {
  EstudianteModel? estudiante;
  List<RecordatorioModel> listaRecordatorios = <RecordatorioModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                        estudianteCodigoDB: estudiante!.codigoDB,
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

  void listarRecordatorios(String codigoDB) {
    final String path = codigoDB;
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('recordatorios');
    starCountRef.child(path).onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<String, dynamic>?;
      if (data != null) {
        listaRecordatorios.clear();
        data.forEach((key, value) {
          listaRecordatorios.add(RecordatorioModel(
            nombre: value['nombre'],
            estudianteCodigoDB: value['estudianteCodigoDB'],
            fechaRecordatorio: DateTime.parse(value['fechaRecordatorio']),
            isRecordatorio: value['isRecordatorio']=='true'?true:false,
            texto: value['texto'],
            codigoDB: value['codigoDB'],
          ));
        });
        setState(() {
          listaRecordatorios;
        });
      }
    });
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
                ])),
                IconButton(
                    onPressed: () => listarRecordatorios(estudiante.codigoDB!),
                    icon: const Icon(Icons.refresh)),
              ],
            )
          ],
        )),
        Wrap(
          children: listaRecordatoriosWidget(),
        ),
      ],
    );
  }

  List<Widget> listaRecordatoriosWidget() {
    List<Widget> recordatorios = [];
    listaRecordatorios.forEach((element) {
      recordatorios.add(CardRecordatorioWidget(
        recordatorioModel: element,
      ));
      setState(() {});
    });
    return recordatorios;
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
