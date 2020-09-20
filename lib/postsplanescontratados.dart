import 'package:flutter/material.dart';
import 'package:prueba_flutter/PlanesUsuario.dart';
import 'http_service.dart';


class PostsPagePlanesContratados extends StatelessWidget {
  final HttpService htppService = HttpService();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Planes Contratados por Usuario")),
      ),
      body: FutureBuilder(
        future: htppService.getPostsPlanContratado(),
        builder: (BuildContext context, AsyncSnapshot<List<PlanesUsuario>> snapshot) {
          if(snapshot.hasData) {
            List<PlanesUsuario> planes = snapshot.data;
            return ListView(
                children: planes.map((PlanesUsuario plan) => ListTile(
                  title: Center(child: Text("Plan Contratado: ${plan.id.toString()}")),
                  subtitle: Center(child: Text("ID de Plan: ${plan.plan_id} \nID de Usuario: ${plan.usuario_id} \nStatus: ${plan.status}")),
                  /*onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlanDetalle(
                          plan: plan
                      )
                      ))*/
                )).toList()
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );

  }


}