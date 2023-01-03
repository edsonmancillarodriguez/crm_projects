import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_model.dart';
import 'package:firebase_database/firebase_database.dart';

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

  Future<EstudianteModel?> verEstudiante(String codigoDB) async {
    final ref = FirebaseDatabase.instance.ref();
    final value = (await ref.child('estudiantes/$codigoDB').get()).value
        as Map<String, dynamic>?;
    if (value != null) {
      print(value);
      return EstudianteModel(
        nombre: value['nombre'],
        refTelefono: value['refTelefono'],
        telefono: value['telefono'],
        dni: value['dni'],
        correo: value['correo'],
        codigoDB: value['codigoDB'],
      );
    } else {
      print('EstudianteController.verEstudianteNo data available.');
      return null;
    }
  }

  Future<String?> eliminarEstudiante(String codigoDB) async{
    try {
      final ref = FirebaseDatabase.instance.ref();
      await ref.child('estudiantes/$codigoDB').remove();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
