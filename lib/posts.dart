//import 'dart:html';
import 'package:flutter/material.dart';
import 'Factura.dart';
import 'factura_detalle.dart';
import 'http_service.dart';

class PostsPage extends StatelessWidget {
  final HttpService htppService = HttpService();

  Widget build(BuildContext context) {
    print('se cae');
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Facturas: Tap para mas detalles")),
      ),

      body: FutureBuilder(

        future: htppService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Factura>> snapshot) {
          if(snapshot.hasData) {
            List<Factura> facturas = snapshot.data;
            return ListView(
              children: facturas.map((Factura factura) => ListTile(
                  title: Center(child: Text("Id de Factura: ${factura.id.toString()}")),
                  subtitle: Center(child:Text("Serie: ${factura.serie}")),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FacturaDetalle(
                        factura: factura
                      )
                      )) ,
              )).toList()
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );

  }


}