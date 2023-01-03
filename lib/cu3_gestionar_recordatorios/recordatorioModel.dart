// To parse this JSON data, do
//
//     final recordatorioModel = recordatorioModelFromJson(jsonString);

import 'dart:convert';

import 'package:crm_projects/global_services/generate_code.dart';
import 'package:firebase_database/firebase_database.dart';

RecordatorioModel recordatorioModelFromJson(String str) => RecordatorioModel.fromJson(json.decode(str));

String recordatorioModelToJson(RecordatorioModel data) => json.encode(data.toJson());

class RecordatorioModel {
  RecordatorioModel({
    this.nombre,
    this.texto,
    this.isRecordatorio,
    this.fechaRecordatorio,
    this.estudianteCodigoDB,
    this.codigoDB,
  });

  String? nombre;
  String? texto;
  bool? isRecordatorio;
  DateTime? fechaRecordatorio;
  String? estudianteCodigoDB;
  String? codigoDB;

  factory RecordatorioModel.fromJson(Map<String, dynamic> json) => RecordatorioModel(
    nombre: json["nombre"],
    texto: json["texto"],
    isRecordatorio: json["isRecordatorio"],
    fechaRecordatorio: json["fechaRecordatorio"],
    estudianteCodigoDB: json["estudianteCodigoDB"],
    codigoDB: json["codigoDB"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "texto": texto,
    "isRecordatorio": isRecordatorio,
    "fechaRecordatorio": fechaRecordatorio.toString(),
    "estudianteCodigoDB": estudianteCodigoDB,
    "codigoDB": codigoDB,
  };

  Future<String?> registrarRecordatorio() async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("recordatorios/$estudianteCodigoDB");
      codigoDB = generateCode();
      await ref.child(codigoDB!).set(toJson());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> actualizarRecordatorio() async {
    try {
      //TODO: Conectar a la base de datos y actualizar... retorna null si registra correctamente
      DatabaseReference ref = FirebaseDatabase.instance.ref("recordatorios/$estudianteCodigoDB");
      await ref.child(codigoDB!).set(toJson());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  String toString() {
    return 'RecordatorioModel{nombre: $nombre, texto: $texto, isRecordatorio: $isRecordatorio, fechaRecordatorio: $fechaRecordatorio}';
  }
}
