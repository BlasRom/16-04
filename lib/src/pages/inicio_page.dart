import 'package:flutter/material.dart';
class InicioPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Inicio")
    ,
    ),
     body: Center(
          child: Text('Bienvenido'),
          
        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left)  ,
          onPressed: (){
             Navigator.pop(context);
          },
          
          ),
          
    );
    
  }
}