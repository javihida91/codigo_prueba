import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_flutter/Factura.dart';


Future<Factura> createFactura(String serie, String secuencial, String fecha_emision, double subtotal, double iva, double total, String estado_pago, int usuario_id, String status) async{
  print(serie);
  print(secuencial);
  print(subtotal.toString());
  final String apiUrl = "http://35.166.58.59:8080/facturas";
  final response = await http.post(apiUrl, body: {
    "serie": serie,
    "secuencial": secuencial,
    "fecha_emision": fecha_emision,
    "subtotal": subtotal.toString(),
    "iva": iva.toString(),
    "total": total.toString(),
    "estado_pago": estado_pago,
    "usuario_id": usuario_id.toString(),
    "status": status
  });

  if(response.statusCode == 201){
    final String responseString = response.body;

    return facturaFromJson(responseString);
  }else{
    return null;
  }
}

class FacturarPage extends StatefulWidget {
  @override
  _FacturaState createState() => _FacturaState();
}


class _FacturaState extends State <FacturarPage> {
  Factura _factura;
  final TextEditingController serieController = TextEditingController();
  final TextEditingController secuencialController = TextEditingController();
  final TextEditingController fecha_emisionController = TextEditingController();
  final TextEditingController subtotalController = TextEditingController();
  final TextEditingController ivaController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController estado_pagoController = TextEditingController();
  final TextEditingController usuario_idController = TextEditingController();
  final TextEditingController statusController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingrese Datos para la Factura"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Serie: formato(000-000)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: serieController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Serie no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Secuencial: (0-99)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: secuencialController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Secuencial no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Fecha Emision: formato(AAAA-MM-DD)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: fecha_emisionController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Fecha no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Subtotal: (.decimal)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: subtotalController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Subtotal no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'I.V.A: (.decimal)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: ivaController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo I.V.A no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Total: (.decimal)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: totalController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Total no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Estado de Pago: (Pagado/Pendiente)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: estado_pagoController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Estado de Pago no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'ID de Usuario',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: usuario_idController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo ID no puede estar vacio';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Status: (A/I)',
                      labelStyle: TextStyle(fontSize: 15)),
                  controller: statusController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Status no puede estar vacio';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20,),

              MaterialButton(
                child: Text("Crear Factura", style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
                onPressed: () async {
                  final String serie = serieController.text;
                  final String secuencial = secuencialController.text;
                  final String fecha_emision = fecha_emisionController.text;
                  final double subtotal = double.parse(subtotalController.text);
                  final double iva = double.parse(ivaController.text);
                  final double total = double.parse(totalController.text);
                  final String estado_pago = estado_pagoController.text;
                  final int usuario_id = int.parse(usuario_idController.text);
                  final String status = statusController.text;

                  final Factura factura = await createFactura(
                      serie,
                      secuencial,
                      fecha_emision,
                      subtotal,
                      iva,
                      total,
                      estado_pago,
                      usuario_id,
                      status);

                  setState(() {
                    _factura = factura;
                  });
                },
                color: Theme
                    .of(context)
                    .primaryColor,

              ),
              _factura == null ? Container() :
              Text("La factura ${_factura.id} con serie ${_factura
                  .serie} esta creada con exito")

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
