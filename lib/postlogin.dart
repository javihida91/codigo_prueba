import 'package:flutter/material.dart';
import 'package:prueba_flutter/posts.dart';
import 'Usuario.dart';
import 'api.dart';
import 'contrato_plan.dart';
import 'facturar.dart';
import 'postsplanes.dart';
import 'postsplanescontratados.dart';


class PostsPageLogin extends StatelessWidget {
  final Api api = Api();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elija una Opcion")
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            children: <Widget>[
              MaterialButton(child:
              Text("Planes", style: Theme.of(context).textTheme.headline6,),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PostsPagePlanes();
                })),
                color: Theme.of(context).primaryColor,
            ),
              MaterialButton(child:
              Text("Planes Contratados", style: Theme.of(context).textTheme.headline6,),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PostsPagePlanesContratados();
                })),
                color: Theme.of(context).primaryColor,
              ),
              MaterialButton(child:
              Text("Listado de Facturas", style: Theme.of(context).textTheme.headline6,),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PostsPage();
                })),
                color: Theme.of(context).primaryColor,
              ),
              MaterialButton(child:
              Text("Facturar", style: Theme.of(context).textTheme.headline6,),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FacturarPage();
                })),
                color: Theme.of(context).primaryColor,
              ),
              MaterialButton(child:
              Text("Contratar Nuevo Plan", style: Theme.of(context).textTheme.headline6,),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ContratarPlanPage();
                })),
                color: Theme.of(context).primaryColor,
              )
          ]
      ),
      )
    );

  }

}