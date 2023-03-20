import 'package:flutter/material.dart';
import 'package:projeto_teste_guide/resources/views/Menu.dart';


class RouteGenerator{

  static Route<dynamic> ? generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch( settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => Menu());
      default:
        _errorRouta();
    }
  }

  /** CASO A ROTA NAO EXITIS*/
  static Route<dynamic> _errorRouta(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
            child:
            Text("Tela nao encontrada")
        ),
      );
    });
  }
}