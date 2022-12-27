// To parse this JSON data, do
//
//     final carreraModel = carreraModelFromJson(jsonString);

import 'dart:convert';

CarreraModel carreraModelFromJson(String str) => CarreraModel.fromJson(json.decode(str));

String carreraModelToJson(CarreraModel data) => json.encode(data.toJson());

class CarreraModel {
  CarreraModel({
    this.id,
    this.nombre,
    this.sigla,
    this.nModulos,
    this.modalidad,
  });

  String? id;
  String? nombre;
  bool? sigla;
  int? nModulos;
  String? modalidad;

  factory CarreraModel.fromJson(Map<String, dynamic> json) => CarreraModel(
    id: json["id"],
    nombre: json["nombre"],
    sigla: json["sigla"],
    nModulos: json["nModulos"],
    modalidad: json["modalidad"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "sigla": sigla,
    "nModulos": nModulos,
    "modalidad": modalidad,
  };

  void registrarCarrera(){
    throw UnimplementedError();

  }

  void actualizarCarrera(){
    throw UnimplementedError();

  }

  CarreraModel verCarrera(String id){
    throw UnimplementedError();

  }

  List<CarreraModel> listarCarreras(){
    throw UnimplementedError();

  }
}
