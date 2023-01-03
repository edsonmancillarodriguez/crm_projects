import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_controller.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_form_widget.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/estudiantes_por_carreras_view.dart';
import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_model.dart';
import 'package:flutter/material.dart';

class CarrerasView extends StatefulWidget {
  final String routeName = 'CarrerasView';

  const CarrerasView({Key? key}) : super(key: key);

  @override
  State<CarrerasView> createState() => _CarrerasViewState();
}

class _CarrerasViewState extends State<CarrerasView> {
  List<CarreraModel> listaCarreras = List<CarreraModel>.generate(20, (index) => CarreraController().verCarrera(index.toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carreras View'),
        centerTitle: true,
        actions: [
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.school),
              onPressed: () async {
                //tiene que esperar el resultado del dialogo, y si es exitoso entonces actualiza la vista y muestra el snackBarMessage
                //si hay errores lo muestra en el snackBarMessage y no actualiza la vista
                await showDialog<String?>(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: CarreraFormWidget(
                        option: 'Registrar',
                      ),
                    );
                  },
                );
              },
              label: const Text('Registrar Carrera'),
            ),
          ),
        ],
      ),
      drawer: const MenuWidget(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0), //mejorar la vista ux para telefonos
        itemCount: listaCarreras.length,
        itemBuilder: (context, index) => SizedBox(
          child: Card(
            child: ListTile(
              title: Text('${listaCarreras[index].nombre}'),
              subtitle: Text('${listaCarreras[index].sigla}'),
              leading: const Icon(Icons.school),
              trailing: Wrap(
                spacing: 30,
                children: [
                  Tooltip(
                    message: 'Ver estudiantes inscritos',
                    child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, const EstudiantesPorCarrerasView().routeName, arguments: listaCarreras[index]);
                        },
                        icon: const Icon(Icons.sticky_note_2)),
                  ),
                  Tooltip(
                    message: 'Editar Carrera',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: CarreraFormWidget(
                                  option: 'Actualizar',
                                  carreraModel: listaCarreras[index],
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
                                child: CarreraFormWidget(
                                  option: 'Ver',
                                  carreraModel: listaCarreras[index],
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                  ),
                  Tooltip(
                    message: 'Eliminar Carrera',
                    child: IconButton(
                        onPressed: () async {
                          showDialog<String?>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Seguro que desea eliminar esta Carrera ${listaCarreras[index].nombre}'),
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

  void registrarCarrera(){
    throw UnimplementedError();

  }

  void actualizarCarrera(){
    throw UnimplementedError();

  }

  CarreraModel verCarrera(String id){
    throw UnimplementedError();

  }

  Future<List<CarreraModel>> listarCarreras() async {
    final xxx = await CarreraController().listarCarreras();
      if(xxx == String){
        print('Listar Carreras $xxx');
        return <CarreraModel>[];
      }
       return xxx as List<CarreraModel>;
  }
}
