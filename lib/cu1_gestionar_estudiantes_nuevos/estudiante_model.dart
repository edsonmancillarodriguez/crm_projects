// To parse this JSON data, do
//
//     final estudianteModel = estudianteModelFromJson(jsonString);

import 'dart:convert';

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
  });

  String? nombre;
  String? correo;
  String? telefono;
  String? dni;
  String? refTelefono;

  factory EstudianteModel.fromJson(Map<String, dynamic> json) =>
      EstudianteModel(
        nombre: json["nombre"],
        correo: json["correo"],
        telefono: json["telefono"],
        dni: json["dni"],
        refTelefono: json["refTelefono"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "dni": dni,
        "refTelefono": refTelefono,
      };

  ///Retorna null "si registro correctamente en base de dato"
  ///
  /// Retorna un String "si no registra y retorna el erroMessage"
  Future<String?> registrarEstudiante() async {
    //retorna null si registro correctamente o si no registro retorna el errorMessage
    try {
      //TODO: Conectar a la base de datos y registrar... retorna null si registra correctamente
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> actualizarEstudiante() async {
    try {
      //TODO: Conectar a la base de datos y actualizar... retorna null si registra correctamente
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  EstudianteModel verEstudiante() {
    //TODO: Hacer el metodo ver
    throw UnimplementedError();
  }

  @override
  String toString() {
    return 'EstudianteModel{nombre: $nombre, correo: $correo, telefono: $telefono, dni: $dni, refTelefono: $refTelefono}';
  }
}
