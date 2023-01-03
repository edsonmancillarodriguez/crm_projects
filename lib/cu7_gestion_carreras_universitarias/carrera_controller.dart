import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_model.dart';

class CarreraController {
  Future<String?> registrarCarrera(
      {String? id,
      String? nombre,
      String? sigla,
      int? nModulos,
      String? modalidad = 'Presencial'}) async {
    return await CarreraModel(
            id: id,
            nombre: nombre,
            sigla: sigla,
            nModulos: nModulos,
            modalidad: modalidad)
        .registrarCarrera();
  }

  Future<String?> actualizarCarrera({required CarreraModel carreraModel}) async {
    return await carreraModel.actualizarCarrera();
  }

  CarreraModel verCarrera(String id) {
    return CarreraModel(
      id: id,
      nombre: 'Ingenieria de Sistemas $id',
      modalidad: 'Presencial',
      nModulos: 60,
      sigla: 'ING${id}00',
    );
  }

  ///Retorna un Objeto de tipo [List<CarreraModel>] si esta correcto.
  ///Retorna un Objeto de tipo [String], si ocurre algun error.
  Future<Object> listarCarreras() async {

    return CarreraModel().listarCarreras();
  }
}
