import 'package:flutter/material.dart';

class TextoCustomizado extends StatelessWidget {

  final dynamic text;
  final TextStyle textStyle;

  TextoCustomizado(this.text,this.textStyle);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(25),
     child: Text('${this.text}',style: this.textStyle,),);
  }
}
