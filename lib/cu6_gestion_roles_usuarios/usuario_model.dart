// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.uid,
    this.nombre,
    this.dni,
    this.telefono,
  });

  String? uid;
  String? nombre;
  bool? dni;
  String? telefono;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
    uid: json["uid"],
    nombre: json["nombre"],
    dni: json["dni"],
    telefono: json["telefono"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "nombre": nombre,
    "dni": dni,
    "telefono": telefono,
  };

  UsuarioModel actualizarRol(){
    throw UnimplementedError();

  }
}
