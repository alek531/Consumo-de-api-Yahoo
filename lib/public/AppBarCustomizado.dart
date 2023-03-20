import 'package:flutter/material.dart';

class AppBarCustomizado extends StatelessWidget {

  final Container container;
  final bool risizescrool;
  final Function() onpressed;

  AppBarCustomizado({
    required this.container,
    required this.risizescrool,
    required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            title: Text("Api Yahoo", style: TextStyle(fontSize: 18,
                color: Colors.white),),
        ),
        resizeToAvoidBottomInset: this.risizescrool,
        body: this.container,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: this.onpressed,
          child: Icon(Icons.bar_chart_sharp,color: Colors.white,),
        ),
    );
  }
}
