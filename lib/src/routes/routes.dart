  import 'package:flutter/material.dart';
import 'package:pruebafirebase/src/pages/inicio_page.dart';
import 'package:pruebafirebase/src/pages/login_page.dart';
import 'package:pruebafirebase/src/pages/opFirebase.dart';

    Map<String, WidgetBuilder> obtenerRutas(){
      return <String, WidgetBuilder>{
        '/': (BuildContext context)=> LoginPage(),
        'Login': (BuildContext context)=>  LoginPage(),
        'Inicio': (BuildContext context)=> InicioPage(),
        'Registrar': (BuildContext context)=> OpFirebase(),

      };
    }