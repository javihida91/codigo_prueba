import 'dart:convert';
import 'package:http/http.dart';

import 'Usuario.dart';


class Api{
//Future loginUser(String email, String password) async{
  String url = "http://35.166.58.59:8080/usuarios";

  Future<bool> getPostsBool(String email, String password) async {
    try {
      Response res = await get(url);
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        List<dynamic> resultado = map["data"];
        List<Usuario> usuarios = List();
        for (var objData in resultado) {
          Usuario usuario = new Usuario(
              id: objData["id"],
              cedula: objData["cedula"],
              contrasena: objData["contrasena"],
              nombres: objData["nombres"],
              apellidos: objData["apellidos"],
              correo: objData["correo"],
              status: objData["status"]
          );
          usuarios.add(usuario);
          if(usuario.correo==email && usuario.contrasena==password){
            print("si entra");
            return true;

          }
          print("no entra");
          return false;
        }
        //recorrer un arreglo de objetos
        for (var objData in usuarios) {
          print(objData.correo);
          print(objData.contrasena);
          //print(objData.contrasena);
        }
        // List<Factura> facturas = body.map((dynamic item) => Factura.fromJson(item)).toList();
        //return usuarios;
      } else {
        throw "Fallo la solicitud";
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future<List<Usuario>> getPosts() async {
    try {
      Response res = await get(url);
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        List<dynamic> resultado = map["data"];
        List<Usuario> usuarios = List();
        for (var objData in resultado) {
          Usuario usuario = new Usuario(
              id: objData["id"],
              cedula: objData["cedula"],
              contrasena: objData["contrasena"],
              nombres: objData["nombres"],
              apellidos: objData["apellidos"],
              correo: objData["correo"],
              status: objData["status"]
          );
          usuarios.add(usuario);
        }
        //recorrer un arreglo de objetos
        for (var objData in usuarios) {
            print(objData.correo);
            print(objData.contrasena);
          //print(objData.contrasena);
        }
        // List<Factura> facturas = body.map((dynamic item) => Factura.fromJson(item)).toList();
        return usuarios;
      } else {
        throw "Fallo la solicitud";
      }
    }catch(e){
      print(e.toString());
    }
  }

  /*bool puedeEntrar() {
    if(email=="hola" && password=="hola") {
      return true;
    }
    return false;
  }*/


  /*final response = await http.post(
    url,
    headers: {"Accept": "Application/json"},
    body: {'email': email, 'password': password}
  );
  var convertedDatatoJason = jsonDecode(response.body);
  return convertedDatatoJason;*/

}