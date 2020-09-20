import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PlanesUsuario.dart';


Future<PlanesUsuario> createPlan(int usuario_id, int plan_id) async{

  final String apiUrl = "http://35.166.58.59:8080/planesusuario";
  final response = await http.post(apiUrl, body: {
    "usuario_id": usuario_id.toString(),
    "plan_id": plan_id.toString(),
  });

  if(response.statusCode == 201){
    final String responseString = response.body;

    return planusuarioFromJson(responseString);
  }else{
    return null;
  }
}

class ContratarPlanPage extends StatefulWidget {
  @override
  _ContratarPlanState createState() => _ContratarPlanState();
}


class _ContratarPlanState extends State <ContratarPlanPage> {
  PlanesUsuario _planesUsuario;
  final TextEditingController usuario_idController = TextEditingController();
  final TextEditingController plan_idController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contratar Nuevo Plan"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'ID de Usuario',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: usuario_idController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo ID de usuario no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Tipo Plan: 1: BRONCE/2: PLATA/3: ORO',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: plan_idController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Tipo plan no puede estar vacio';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20,),

              MaterialButton(
                child: Text("Contratar", style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
                onPressed: () async {
                  final int usuario_id = int.parse(usuario_idController.text);
                  final int plan_id = int.parse(plan_idController.text);

                  final PlanesUsuario planusuario = await createPlan(
                      usuario_id,
                      plan_id,
                      );

                  setState(() {
                    _planesUsuario = planusuario;
                  });

                },
                color: Theme
                    .of(context)
                    .primaryColor,

              ),

              _planesUsuario == null ? Container() :
              Text("Su contrato ${_planesUsuario.plan_id} con ID de usuario ${_planesUsuario.usuario_id} esta creada con exito")


            ]
        ),

      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final String cedula = cedulaController.text;
          final String contrasena = contrasenaController.text;
          final String nombres = nombresController.text;
          final String apellidos = apellidosController.text;
          final String correo = correoController.text;


          final Usuario usuario = await createUser(cedula, contrasena, nombres, apellidos, correo);

          setState(() {
            _usuario = usuario;
          });
        },
      ),*/
    );
  }
}
