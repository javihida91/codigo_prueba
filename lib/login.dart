import 'package:flutter/material.dart';
import 'package:prueba_flutter/custom.widgets.dart';
import 'package:prueba_flutter/postlogin.dart';
import 'package:prueba_flutter/registro.dart';

import 'api.dart';
import 'intro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message='';


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(fontSize: 20)),
                                controller: emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo Email no puede estar vacio';
                                  }
                                  return null;
                                }),
                            SizedBox(height: 10),
                            TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(fontSize: 20)),
                                controller: passwordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo Password no puede estar vacio';
                                  }
                                  return null;
                                }),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Nuevo Usuario?"),
                                FlatButton(
                                  child: Text(
                                    "Registrarse",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return RegistroPage();
                                  })),
                                )
                              ],
                            ),
                            MaterialButton(child:
                            Text("Login", style: Theme.of(context).textTheme.bodyText1,),
                              onPressed: ()  => Navigator.push(context, MaterialPageRoute(builder: (context){
                                return PostsPageLogin();
                              })),
                              color: Theme.of(context).primaryColor,
                            ),
                           /* CustomButton(onBtnPressed: () async{
                              if(_formKey.currentState.validate()){
                                var email = emailController.text;
                                var password = emailController.text;

                                setState(() {
                                  message = "Espere por favor...";

                                });
                              }
                            }, btnText: 'Login',),*/
                            /*MaterialButton(
                              child: Text(
                                "Login",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return IntroPage();
                              })),
                              color: Theme.of(context).primaryColor,
                            ),*/
                            SizedBox(height: 10),
                            Text(message),
                          ],
                        )))
              ],
            ),
          )
        ],

      ),
    );
  }
}
