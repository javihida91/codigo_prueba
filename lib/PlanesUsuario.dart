import 'dart:convert';

PlanesUsuario planusuarioFromJson(String str) => PlanesUsuario.fromJson(json.decode(str));
String planusuarioToJson(PlanesUsuario data) => json.encode(data.toJson());

class PlanesUsuario {
  final int id;
  final int usuario_id;
  final int plan_id;
  final String status;

  PlanesUsuario({
    this.id,
    this.usuario_id,
    this.plan_id,
    this.status,
  });

  factory PlanesUsuario.fromJson(Map<String, dynamic> json) {
    return PlanesUsuario(
        id: int.parse(json['id']),
        usuario_id: int.parse(json['usuario_id']),
        plan_id: int.parse(json['plan_id']),
        status: json['status'] as String);
  }

  Map<String, dynamic> toJson() =>
      {

        //"id": id,
        "usuario_id": usuario_id,
        "plan_id": plan_id,

        //"status": status,

      };
}