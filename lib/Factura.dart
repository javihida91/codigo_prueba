import 'dart:convert';


Factura facturaFromJson(String str) => Factura.fromJson(json.decode(str));
String facturaToJson(Factura data) => json.encode(data.toJson());

class Factura {
  final int id;
  final String serie;
  final String secuencial;
  final String fecha_emision;
  final double subtotal;
  final double iva;
  final double total;
  final String estado_pago;
  final int usuario_id;
  final String status;

  Factura({
    this.id,
    this.serie,
    this.secuencial,
    this.fecha_emision,
    this.subtotal,
    this.iva,
    this.total,
    this.estado_pago,
    this.usuario_id,
    this.status
  });

  factory Factura.fromJson(Map<String, dynamic> json) {
    return Factura(
        id: int.parse(json['id']),
        serie: json['serie'],
        secuencial: json['secuencial'],
        fecha_emision: json['fecha_emision'],
        subtotal: double.parse(json['subtotal']),
        iva: double.parse(json['iva']),
        total: double.parse(json['total']),
        estado_pago: json['estado_pago'] ,
        usuario_id: int.parse(json['usuario_id']),
        status: json['status']
    );
  }

  Map<String, dynamic> toJson() => {

    //"id": id,
    "serie": serie,
    "secuencial": secuencial,
    "fecha_emision": fecha_emision,
    "subtotal": subtotal,
    "iva": iva,
    "total": total,
    "estado_pago": estado_pago,
    "usuario_id": usuario_id,
    "status": status,


  };
}