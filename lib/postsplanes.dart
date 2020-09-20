//import 'dart:html';
import 'package:flutter/material.dart';
import 'Factura.dart';
import 'Plan.dart';
import 'factura_detalle.dart';
import 'http_service.dart';
import 'plan_detalle.dart';

class PostsPagePlanes extends StatelessWidget {
  final HttpService htppService = HttpService();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Planes: Tap para mas detalles")),
      ),
      body: FutureBuilder(
        future: htppService.getPostsPlan(),
        builder: (BuildContext context, AsyncSnapshot<List<Plan>> snapshot) {
          if(snapshot.hasData) {
            List<Plan> planes = snapshot.data;
            return ListView(
                children: planes.map((Plan plan) => ListTile(
                  title: Center(child: Text(plan.nombre)),
                  subtitle: Center(child:Text(plan.id.toString())),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlanDetalle(
                          plan: plan
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