// To parse this JSON data, do
//
//     final recordatorioModel = recordatorioModelFromJson(jsonString);

import 'dart:convert';

RecordatorioModel recordatorioModelFromJson(String str) => RecordatorioModel.fromJson(json.decode(str));

String recordatorioModelToJson(RecordatorioModel data) => json.encode(data.toJson());

class RecordatorioModel {
  RecordatorioModel({
    this.nombre,
    this.texto,
    this.isRecordatorio,
    this.fechaRecordatorio,
  });

  String? nombre;
  String? texto;
  bool? isRecordatorio;
  DateTime? fechaRecordatorio;

  factory RecordatorioModel.fromJson(Map<String, dynamic> json) => RecordatorioModel(
    nombre: json["nombre"],
    texto: json["texto"],
    isRecordatorio: json["isRecordatorio"],
    fechaRecordatorio: json["fechaRecordatorio"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "texto": texto,
    "isRecordatorio": isRecordatorio,
    "fechaRecordatorio": fechaRecordatorio,
  };

  Future<String?> registrarRecordatorio() async {
    try {
      //TODO: Conectar a la base de datos y registrar... retorna null si registra correctamente
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> actualizarRecordatorio() async {
    try {
      //TODO: Conectar a la base de datos y actualizar... retorna null si registra correctamente
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  RecordatorioModel verRecordatorio(){
    //TODO: Hacer el metodo ver
    throw UnimplementedError();
  }

  @override
  String toString() {
    return 'RecordatorioModel{nombre: $nombre, texto: $texto, isRecordatorio: $isRecordatorio, fechaRecordatorio: $fechaRecordatorio}';
  }
}
