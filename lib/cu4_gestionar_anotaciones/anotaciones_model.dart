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
  DateTime? fechaRecordatorio;

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

  Future<String?> registrarAnotacion() async {
    try {
      //TODO: Conectar a la base de datos y registrar... retorna null si registra correctamente
      return null;
    }catch (e){
      return e.toString();
    }

  }

  Future<String?> actualizarAnotacion() async {
    try {
      //TODO: Conectar a la base de datos y actualiza... retorna null si actualiza correctamente
      return null;
    }catch (e){
      return e.toString();
    }

  }

  AnotacionModel verAnotacion(){
    //TODO: hacer el metodo ver
    throw UnimplementedError();

  }

  @override
  String toString() {
    return 'AnotacionModel{nombre: $nombre, texto: $texto, isRecordatorio: $isRecordatorio, fechaRecordatorio: $fechaRecordatorio}';
  }
}
