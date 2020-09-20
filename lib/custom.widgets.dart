import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText, this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(child:
    Text(btnText, style: Theme.of(context).textTheme.bodyText1,),
      /*onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
        return Login();
      })),*/
      onPressed: onBtnPressed,
      color: Theme.of(context).primaryColor,
    );

  }
}