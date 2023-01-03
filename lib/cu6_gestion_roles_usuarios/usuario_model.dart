// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

class UsuarioModel {

  static final UsuarioModel _instance = UsuarioModel._internal();

  factory UsuarioModel() => _instance;
  UsuarioModel._internal();

  String? uid;
  String? nombre;
  String? dni;
  String? telefono;

  // factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
  //   uid: json["uid"],
  //   nombre: json["nombre"],
  //   dni: json["dni"],
  //   telefono: json["telefono"],
  // );

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
