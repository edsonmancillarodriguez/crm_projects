import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_model.dart';

class EstudianteController {
  Future<String?> registrarEstudiante({
    required String nombre,
    required String correo,
    required String telefono,
    required String carnetIdentidad,
    required String telefonoReferencia,
  }) async {
    // EstudianteModel(nombre: nombre,telefono: telefono,refTelefono: telefonoReferencia,dni: carnetIdentidad, correo: correo).registrarEstudiante();

    return await EstudianteModel(
            nombre: nombre,
            telefono: telefono,
            refTelefono: telefonoReferencia,
            dni: carnetIdentidad,
            correo: correo)
        .registrarEstudiante();
  }

  Future<String?> actualizarEstudiante({
    required EstudianteModel estudianteModel,
  }) async {
    // await estudianteModel.actualizarEstudiante();
    return await estudianteModel
        .actualizarEstudiante(); //retorna null si actualizo, false si hubo errores y manda el error
  }

  EstudianteModel verEstudiante() {
    //esta retornando un EstudianteModel() ejemplo
    return EstudianteModel(
      nombre: 'Estudiante Example',
      correo: 'example@example.com',
      dni: '99999999',
      telefono: '77777777',
      refTelefono: '8888888',
    );
  }

  Future<List<EstudianteModel>?> listarEstudiante() async {
    return List<EstudianteModel>.generate(
      10,
      (index) => EstudianteModel(
        nombre: 'Estudiante $index',
        correo: 'example$index@example.com',
        dni: '${index}99999999',
        telefono: '${index}77777777',
        refTelefono: '${index}8888888',
      ),
    );
  }
}
