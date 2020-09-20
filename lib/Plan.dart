import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));
String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  final int id;
  final String nombre;
  final double subtotal;
  final double iva;
  final String tipo;
  final String status;

  Plan({
    this.id,
    this.nombre,
    this.subtotal,
    this.iva,
    this.tipo,
    this.status,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
        id: json['id'] as int,
        nombre: json['nombre'] as String,
        subtotal: json['subtotal'] as double,
        iva: json['iva'] as double,
        tipo: json['tipo'] as String,
        status: json['status'] as String);
  }

  Map<String, dynamic> toJson() =>
      {

        //"id": id,
        "nombre": nombre,
        "subtotal": subtotal,
        "iva": iva,
        "tipo": tipo,
        //"status": status,

      };
}