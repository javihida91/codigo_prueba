import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Usuario.dart';

Future<Usuario> createUser(String cedula, String contrasena, String nombres, String apellidos, String correo) async{
  final String apiUrl = "http://35.166.58.59:8080/usuarios";
  final response = await http.post(apiUrl, body: {
    "cedula": cedula,
    "contrasenia": contrasena,
    "nombres": nombres,
    "apellidos": apellidos,
    "correo": correo,
  });

  if(response.statusCode == 201){
    final String responseString = response.body;


    return usuarioFromJson(responseString);
  }else{
    return null;
  }
}

class RegistroPage extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}


class _RegistroState extends State <RegistroPage>{
  Usuario _usuario;
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController correoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Registro"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nombres',
                    labelStyle: TextStyle(fontSize: 32)),
                controller: nombresController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo Nombres no puede estar vacio';
                  }
                  return null;
                }
            ),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Apellidos',
                    labelStyle: TextStyle(fontSize: 32)),
                controller: apellidosController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo Apellidos no puede estar vacio';
                  }
                  return null;
                }
            ),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Correo',
                    labelStyle: TextStyle(fontSize: 32)),
                controller: correoController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo Correo no puede estar vacio';
                  }
                  return null;
                }
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Cedula',
                  labelStyle: TextStyle(fontSize: 32)),
              controller: cedulaController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo Cedula no puede estar vacio';
                }
                return null;
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Contrasena',
                  labelStyle: TextStyle(fontSize: 32)),
              controller: contrasenaController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo Contrasena no puede estar vacio';
                }
                return null;
              }
            ),

            SizedBox(height: 20,),

            MaterialButton(
              child: Text("+", style: Theme.of(context).textTheme.headline6,),
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
              color: Theme.of(context).primaryColor,

            ),
            _usuario == null ? Container():
            Text("El usuario ${_usuario.nombres} ${_usuario.apellidos} esta creado con exito")

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