import 'package:crm_projects/cu4_gestionar_anotaciones/anotaciones_model.dart';

class AnotacionesController {
  Future<String?> registrarAnotacion({
    String? nombre,
    String? texto,
    bool? isRecordatorio,
    DateTime? fechaRecordatorio,
  }) async {
    return await AnotacionModel(
      texto: texto,
      isRecordatorio: isRecordatorio,
      fechaRecordatorio: fechaRecordatorio,
      nombre: nombre
    ).registrarAnotacion();
  }

  Future<String?> actualizarAnotacion({required AnotacionModel anotacionModel}) async {
    return await anotacionModel.actualizarAnotacion();
  }

  AnotacionModel verAnotacion(int codigo) {
    return AnotacionModel(
      nombre: 'Realizar llamadas Anotacion',
      fechaRecordatorio: DateTime.now(),
      isRecordatorio: true,
      texto: 'Realizar llamadas a todos los estudiantes que no han sido asistido a sus reuniones'
    );
  }

  List<AnotacionModel> listarAnotacion() {
    throw UnimplementedError();
  }
}
