import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));
String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  final int id;
  final String cedula;
  final String contrasena;
  final String nombres;
  final String apellidos;
  final String correo;
  final String status;

  Usuario({
    this.id,
    this.cedula,
    this.contrasena,
    this.nombres,
    this.apellidos,
    this.correo,
    this.status,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'] as int,
        cedula: json['cedula'] as String,
        contrasena: json['contrasenia'] as String,
        nombres: json['nombres'] as String,
        apellidos: json['apellidos'] as String,
        correo: json['correo'] as String,
        status: json['status'] as String);
  }

  Map<String, dynamic> toJson() => {

    //"id": id,
    "cedula": cedula,
    "contrasenia": contrasena,
    "nombres": nombres,
    "apellidos": apellidos,
    "correo": correo,
    //"status": status,

  };
}