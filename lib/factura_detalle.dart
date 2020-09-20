import 'package:flutter/material.dart';
import 'Factura.dart';

class FacturaDetalle extends StatelessWidget {
  final Factura factura;

  const FacturaDetalle({
    @required this.factura
  });

  Widget build(BuildContext context) {
    print("hasta aqui");
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizacion de Factura ID: "+factura.id.toString()),

      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(12.0) ,
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Secuencial"),
                subtitle: Text("${factura.secuencial}"),
              ),
              ListTile(
                title: Text("Fecha de Emision"),
                subtitle: Text("${factura.fecha_emision}"),
              ),
              ListTile(
                title: Text("Subtotal"),
                subtitle: Text(("${factura.subtotal}").toString()),
              ),
              ListTile(
                title: Text("I.V.A"),
                subtitle: Text(("${factura.iva}").toString()),
              ),
              ListTile(
                title: Text("Total"),
                subtitle: Text(("${factura.total}").toString()),
              ),
              ListTile(
                title: Text("Estado de Pago"),
                subtitle: Text("${factura.estado_pago}"),
              ),
              ListTile(
                title: Text("ID_Usuario"),
                subtitle: Text(("${factura.usuario_id}").toString()),
              ),
              ListTile(
                title: Text("Status"),
                subtitle: Text("${factura.status}"),
              )
            ],
          ),
        ),),)

    );
  }



}