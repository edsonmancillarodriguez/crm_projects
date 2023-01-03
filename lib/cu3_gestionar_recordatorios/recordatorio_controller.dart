import 'package:firebase_database/firebase_database.dart';

import 'recordatorioModel.dart';

class RecordatorioController {
  Future<String?> registrarRecordatorios({
    String? nombre,
    String? texto,
    bool? isRecordatorio,
    DateTime? fechaRecordatorio,
    String? estudianteCodigoDB,
  }) async {
    return await RecordatorioModel(
      nombre: nombre,
      texto: texto,
      isRecordatorio: isRecordatorio,
      fechaRecordatorio: fechaRecordatorio,
      estudianteCodigoDB: estudianteCodigoDB,
    ).registrarRecordatorio();
  }

  Future<String?> actualizarRecordatorio(
      {required RecordatorioModel recordatorioModel}) async {
    return await recordatorioModel.actualizarRecordatorio();
  }

  Future<RecordatorioModel?> verRecordatorios(String codigoDB) async {
    final ref = FirebaseDatabase.instance.ref();
    final value = (await ref.child('estudiantes/$codigoDB').get()).value
        as Map<String, dynamic>?;
    if (value != null) {
      return RecordatorioModel(
        nombre: value['nombre'],
        codigoDB: value['codigoDB'],
        estudianteCodigoDB: value[''],
        texto: value['texto'],
        isRecordatorio: value['isRecordatorio'] as bool,
        fechaRecordatorio: value['fechaRecordatorio'] as DateTime,
      );
    } else {
      print('EstudianteController.verEstudianteNo data available.');
      return null;
    }
  }

  Future<String?> eliminarRecordatorio(RecordatorioModel recordatorioModel) async {
    try {
      final ref = FirebaseDatabase.instance.ref('recordatorios');
      await ref.child('${recordatorioModel.estudianteCodigoDB}/${recordatorioModel.codigoDB}').remove();
      print('${recordatorioModel.estudianteCodigoDB}/${recordatorioModel.codigoDB}');
      return null;
    } catch (e) {
      return e.toString();
    }
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
