import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class OpFirebase extends StatefulWidget {
  OpFirebase({Key key}) : super(key: key);

  @override
  _OpFirebaseState createState() => _OpFirebaseState();
}

class _OpFirebaseState extends State<OpFirebase> {
  final firebaseInstance = FirebaseFirestore.instance;
  final formkey = GlobalKey<FormState>();
   String usuario;
 String password;
 String correo;
  void agregarFirebase(){
    firebaseInstance.collection('personas').add({
      'Nombre' : usuario,
      'Correo' : correo,
      'Password': password
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar'),
      
      ),
      body:
      
       Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[
                
               Container(  
                  child: Image(image: AssetImage('images/lackmus.jpeg'),),
                ),
                  TextFormField(decoration: InputDecoration(labelText: 'Username', prefixIcon: Icon(Icons.person)
                  ),
                   onSaved: (value){
                    usuario  = value;
                  },
                onEditingComplete:(){
                },
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return 'Este campo no puede estar vacío';
                    }
                  }
                  ),
                  SizedBox(height: 10.0,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password',
                                              prefixIcon: Icon(Icons.lock),
                                              
                                              ),
                  //controller: apTextController,
                  //autofocus: false,
                  onSaved: (value){
                    password= value;
                  },
                
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return 'Este campo no puede estar vacío';
                    }
                  },
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo',
                                              prefixIcon: Icon(Icons.lock),
                                              
                                              ),
                  //controller: apTextController,
                  //autofocus: false,
                  onSaved: (value){
                    correo= value;
                  },
                
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return 'Este campo no puede estar vacío';
                    }
                  },
                ),
                SizedBox(height: 10.0,),
               Container(
                  width: 250.0 ,
                 height: 50.0,
                 decoration: BoxDecoration(border: Border.all(color: Colors.white, style: BorderStyle.solid),),
                  
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                       color: Colors.blue,
                       textColor: Colors.white,


                  onPressed: () {
                    if(formkey.currentState.validate()){
                           formkey.currentState.save();
                           agregarFirebase();
                           Navigator.pop(context);
                                                      }
                           else{
                            print('Datos Incorrectos');
                           }
                    },
                  child: Text('Registrar'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  )
                )
                
              ])
              
              )
              )
    );
    
  }
}