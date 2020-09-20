import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'login.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: MaterialButton(child:
            Text("Getting Started", style: Theme.of(context).textTheme.bodyText1,),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
              return Login();
            })),
            color: Theme.of(context).primaryColor,
          ))
        ]
      ),

    );

  }

}


 