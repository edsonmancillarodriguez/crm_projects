
import 'recordatorioModel.dart';

class RecordatorioController {
  Future<String?> registrarRecordatorios({
    String? nombre,
    String? texto,
    bool? isRecordatorio,
    DateTime? fechaRecordatorio,
  }) async {
    return await RecordatorioModel(
            nombre: nombre,
            texto: texto,
            isRecordatorio: isRecordatorio,
            fechaRecordatorio: fechaRecordatorio)
        .registrarRecordatorio();
  }

  Future<String?> actualizarRecordatorio(
      {required RecordatorioModel recordatorioModel}) async {
    return await recordatorioModel.actualizarRecordatorio();
  }

  RecordatorioModel verRecordatorios() {
    return RecordatorioModel(
        nombre: 'Reunion Virtual',
        texto:
            'Reunion para explicar sobre las carreas de Ingenieria en Sistemas e informatica',
        isRecordatorio: true,
        fechaRecordatorio: DateTime.now());
  }

  List<RecordatorioModel>? listarRecordatorios() {
    return List<RecordatorioModel>.generate(
      10,
      (index) => RecordatorioModel(
        nombre: 'Reunion $index',
        texto: '$index Lorem Ipsumn...',
        isRecordatorio: true,
        fechaRecordatorio: DateTime.now(),
      ),
    );
  }
}
