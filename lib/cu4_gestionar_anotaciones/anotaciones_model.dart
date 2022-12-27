// To parse this JSON data, do
//
//     final anotacionModel = anotacionModelFromJson(jsonString);

import 'dart:convert';

AnotacionModel anotacionModelFromJson(String str) => AnotacionModel.fromJson(json.decode(str));

String anotacionModelToJson(AnotacionModel data) => json.encode(data.toJson());

class AnotacionModel {
  AnotacionModel({
    this.nombre,
    this.texto,
    this.isRecordatorio,
    this.fechaRecordatorio,
  });

  String? nombre;
  String? texto;
  bool? isRecordatorio;
  String? fechaRecordatorio;

  factory AnotacionModel.fromJson(Map<String, dynamic> json) => AnotacionModel(
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

  void registrarAnotacion(){
    throw UnimplementedError();

  }

  AnotacionModel actualizarAnotacion(){
    throw UnimplementedError();

  }

  AnotacionModel verAnotacion(){
    throw UnimplementedError();

  }
}
