import 'dart:convert';

DetallesDePlan ddpFromJson(String str) => DetallesDePlan.fromJson(json.decode(str));
String ddpToJson(DetallesDePlan data) => json.encode(data.toJson());

class DetallesDePlan {
  final int id;
  final String descripcion;
  final int plan_id;
  final int item_id;
  final String status;

  DetallesDePlan({
    this.id,
    this.descripcion,
    this.plan_id,
    this.item_id,
    this.status,
  });

  factory DetallesDePlan.fromJson(Map<String, dynamic> json) {
    return DetallesDePlan(
        id: json['id'] as int,
        descripcion: json['descripcion'] as String,
        plan_id: json['plan_id'] as int,
        item_id: json['item_id'] as int,
        status: json['status'] as String);
  }

  Map<String, dynamic> toJson() =>
      {

        //"id": id,
        "descripcion": descripcion,
        "plan_id": plan_id,
        "item_id": item_id,
        //"status": status,

      };
}
