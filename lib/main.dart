import 'package:flutter/material.dart';
import 'package:projeto_teste_guide/routes/RouteGenerator.dart';

Color definir_colorPadrao = const Color(0xff797979);
final ThemeData temaPadrao = ThemeData(
    primarySwatch:  Colors.grey
);

void main()  {
  //HttpOverrides.global = new MyHttpOverrides();
  runApp(
    MaterialApp(
      title: "Consumo de api Yahooo",
      debugShowCheckedModeBanner: false,
      theme: temaPadrao,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}