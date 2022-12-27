import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_controller.dart';
import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_form_widget.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorios_view.dart';
import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_model.dart';
import 'package:flutter/material.dart';

class EstudianteView extends StatefulWidget {
  final String routeName = 'EstudianteView';

  const EstudianteView({Key? key}) : super(key: key);

  @override
  State<EstudianteView> createState() => _EstudianteViewState();
}

class _EstudianteViewState extends State<EstudianteView> {
  List<EstudianteModel> listaEstudiantes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listarEstudiantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudiantes views'),
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
                      child: EstudianteFormWidget(
                        option: 'Registrar',
                      ),
                    );
                  },
                );
              },
              label: const Text('Registrar Estudiante'),
            ),
          ),
        ],
      ),
      drawer: const MenuWidget(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0), //mejorar la vista ux para telefonos
        itemCount: listaEstudiantes.length,
        itemBuilder: (context, index) => SizedBox(
          child: Card(
            child: ListTile(
              title: Text('${listaEstudiantes[index].nombre}'),
              subtitle: Text('${listaEstudiantes[index].telefono}'),
              leading: const Icon(Icons.person),
              trailing: Wrap(
                spacing: 30,
                children: [
                  Tooltip(
                    message: 'CU3 Gestionar Recordatorios',
                    child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, const RecordatoriosView().routeName, arguments: listaEstudiantes[index]);
                        },
                        icon: const Icon(Icons.sticky_note_2)),
                  ),
                  Tooltip(
                    message: 'Editar Estudiante',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: EstudianteFormWidget(
                                  option: 'Actualizar',
                                  estudianteModel: listaEstudiantes[index],
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
                                child: EstudianteFormWidget(
                                  option: 'Ver',
                                  estudianteModel: listaEstudiantes[index],
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                  ),
                  Tooltip(
                    message: 'Eliminar Estudiante',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Seguro que desea eliminar al usuario ${listaEstudiantes[index].nombre}'),
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
          ),
        ),
      ),
    );
  }

  void registrarEstudiante() {
    //TERMINADO
    throw UnimplementedError();
  }

  void actualizarEstudiante() {
    //TERMINADO
    throw UnimplementedError();
  }

  EstudianteModel verEstudiante() {
    //TERMINADO
    throw UnimplementedError();
  }

  Future<void> listarEstudiantes() async {
    listaEstudiantes = (await EstudianteController().listarEstudiante()) ?? [];
    setState(() {
      listaEstudiantes;
    });
  }
}
