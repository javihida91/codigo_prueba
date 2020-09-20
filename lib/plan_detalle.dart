import 'package:flutter/material.dart';
import 'Factura.dart';
import 'Plan.dart';

class PlanDetalle extends StatelessWidget {
  final Plan plan;

  const PlanDetalle({
    @required this.plan
  });

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalles de Plan: "+plan.nombre),
        ),
        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(12.0) ,
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Tipo"),
                  subtitle: Text("${plan.tipo}"),
                ),
                ListTile(
                  title: Text("Subtotal"),
                  subtitle: Text(("${plan.subtotal}").toString()),
                ),
                ListTile(
                  title: Text("I.V.A"),
                  subtitle: Text(("${plan.iva}").toString()),
                ),
                ListTile(
                  title: Text("Status"),
                  subtitle: Text("${plan.status}"),
                )
              ],
            ),
          ),),)

    );
  }



}