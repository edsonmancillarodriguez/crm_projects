// To parse this JSON data, do
//
//     final estudianteModel = estudianteModelFromJson(jsonString);

import 'dart:convert';

import 'package:crm_projects/global_services/generate_code.dart';
import 'package:firebase_database/firebase_database.dart';

EstudianteModel estudianteModelFromJson(String str) =>
    EstudianteModel.fromJson(json.decode(str));

String estudianteModelToJson(EstudianteModel data) =>
    json.encode(data.toJson());

class EstudianteModel {
  EstudianteModel({
    this.nombre,
    this.correo,
    this.telefono,
    this.dni,
    this.refTelefono,
    this.codigoDB,
  });

  String? nombre;
  String? correo;
  String? telefono;
  String? dni;
  String? refTelefono;
  String? codigoDB;

  factory EstudianteModel.fromJson(Map<String, dynamic> json) =>
      EstudianteModel(
        nombre: json["nombre"],
        correo: json["correo"],
        telefono: json["telefono"],
        dni: json["dni"],
        refTelefono: json["refTelefono"],
        codigoDB: json["codigoDB"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "dni": dni,
        "refTelefono": refTelefono,
        "codigoDB": codigoDB,
      };

  ///Retorna null "si registro correctamente en base de dato"
  ///
  /// Retorna un String "si no registra y retorna el erroMessage"
  Future<String?> registrarEstudiante() async {
    //retorna null si registro correctamente o si no registro retorna el errorMessage
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("estudiantes");
      codigoDB = generateCode();
      await ref.child(codigoDB!).set(toJson());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> actualizarEstudiante() async {
    try {
      //TODO: Conectar a la base de datos y actualizar... retorna null si registra correctamente
      DatabaseReference ref = FirebaseDatabase.instance.ref("estudiantes");
      await ref.child(codigoDB!).set(toJson());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  String toString() {
    return 'EstudianteModel{nombre: $nombre, correo: $correo, telefono: $telefono, dni: $dni, refTelefono: $refTelefono}';
  }
}
