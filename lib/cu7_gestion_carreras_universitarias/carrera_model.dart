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
  String? sigla;
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

  Future<String?> registrarCarrera() async {
    try {
      //TODO: conectar a base de datos y registrar, retornara null si registra correctamente
      return null;
    }catch  (e){
      return e.toString();
    }

  }

  Future<String?> actualizarCarrera() async {
    try {
      //TODO: Conecta a base de datos y actualiza, retorna null si actuaiza correctamente.
      return null;
    }catch (e){
      return e.toString();
    }

  }

  CarreraModel verCarrera(String id){
    return CarreraModel(
      id: id,
      nombre: 'Carrera $id',
      modalidad: 'Virtutal',
      nModulos: 60,
      sigla: 'CV${id}00'
    );

  }

  ///Retorna un Objeto de tipo [List<CarreraModel>] si esta correcto.
  ///Retorna un Objeto de tipo [String], si ocurre algun error.
  Future<Object> listarCarreras() async {
    //TODO: obtiene todas las carreras registradas y las retorna en una Lista ordenada.
    try {
      return <CarreraModel>[];
    }catch (e){
      return e.toString();
    }
  }
}
