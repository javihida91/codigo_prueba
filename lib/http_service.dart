import 'dart:convert';
import 'package:prueba_flutter/DetallesDePlan.dart';
import 'package:prueba_flutter/PlanesUsuario.dart';

import 'Factura.dart';
import 'package:http/http.dart';

import 'Plan.dart';
import 'Usuario.dart';

class HttpService {
  final String postUrl = "http://35.166.58.59:8080/facturas";
  final String postUrlusuario = "http://35.166.58.59:8080/usuarios";
  final String postUrlplanes = "http://35.166.58.59:8080/planes?embed=detalle?embed=item";
  final String postUrlplanescontratados = "http://35.166.58.59:8080/planesusuario";


  Future<List<Factura>> getPosts() async {
    print("posepose");
    try {
      Response res = await get(postUrl);
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        List<dynamic> resultado = map["data"];
        List<Factura> facturas = List();
        for (var objData in resultado) {
          Factura factura = new Factura(
              id: objData["id"],
              serie: objData["serie"],
              secuencial: objData["secuencial"].toString(),
              fecha_emision: objData["fecha_emision"],
              subtotal: double.parse(objData["subtotal"]),
              iva: double.parse(objData["iva"]),
              total: double.parse(objData["total"]),
              estado_pago: objData["estado_pago"],
              usuario_id: objData["usuario_id"],
              status: objData["status"]
          );
          facturas.add(factura);
        }
        //recorrer un arreglo de objetos
        /*for (var objData in facturas) {
          print(objData.id);
          print(objData.status);
        }*/
        // List<Factura> facturas = body.map((dynamic item) => Factura.fromJson(item)).toList();
        return facturas;
      } else {
        throw "Fallo la solicitud";
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future<List<Usuario>> getPostsUsuario() async {
    try {
      Response res = await get(postUrlusuario);
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
        /*for (var objData in facturas) {
          print(objData.id);
          print(objData.status);
        }*/
        // List<Factura> facturas = body.map((dynamic item) => Factura.fromJson(item)).toList();
        return usuarios;
      } else {
        throw "Fallo la solicitud";
      }
    }catch(e) {
      print(e.toString());
    }
  }

  Future<List<Plan>> getPostsPlan() async {
    try {
      Response res = await get(postUrlplanes);
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);

        List<dynamic> resultado = map["data"];


        List<Plan> planes = List();

        for (var objData in resultado) {
          Plan plan = new Plan(
              id: objData["id"],
              nombre: objData["nombre"],
              subtotal: double.parse(objData["subtotal"]),
              iva: double.parse(objData["iva"]),
              tipo: objData["tipo"],
              status: objData["status"]
          );
          planes.add(plan);
        }
        //recorrer un arreglo de objetos
        /*for (var objData in facturas) {
        print(objData.id);
        print(objData.status);
      }*/

        // List<Factura> facturas = body.map((dynamic item) => Factura.fromJson(item)).toList();
        return planes;
      } else {
        throw "Fallo la solicitud";
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future<List<PlanesUsuario>> getPostsPlanContratado() async {
    try {
      Response res = await get(postUrlplanescontratados);
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        List<dynamic> resultado = map["data"];

        List<PlanesUsuario> planes = List();

        for (var objData in resultado) {
          PlanesUsuario plan = new PlanesUsuario(
              id: objData["id"],
              usuario_id: objData["usuario_id"],
              plan_id: objData["plan_id"],
              status: objData["status"]
          );
          planes.add(plan);
        }
        //recorrer un arreglo de objetos
        /*for (var objData in facturas) {
        print(objData.id);
        print(objData.status);
      }*/

        // List<Factura> facturas = body.map((dynamic item) => Factura.fromJson(item)).toList();
        return planes;
      } else {
        throw "Fallo la solicitud";
      }
    }catch(e){
      print(e.toString());
    }
  }

}