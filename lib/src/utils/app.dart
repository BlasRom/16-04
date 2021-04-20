import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pruebafirebase/src/routes/routes.dart';



class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(primaryColor:
      Colors.blue,
      ),
     initialRoute: '/',
     routes: 
     obtenerRutas(), 
      );
    }
 }