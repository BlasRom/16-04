import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final firebaseInstance = FirebaseFirestore.instance;
  final formkey = GlobalKey<FormState>();
   String usuario;
   String password;
   FocusNode usuarioFocus;
   FocusNode passwordFocus;
 void validarFirebase(){
firebaseInstance.collection('personas').where('Nombre', isEqualTo: usuario ).where('Password', isEqualTo: password).snapshots().listen((event) {
  event.docs.forEach((element)
   {
    Navigator.pushNamed(context, 'Inicio');
  }
  
  );
}
);

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Login"),
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
                  TextFormField(decoration: InputDecoration( labelText: 'Username', prefixIcon: Icon(Icons.person)
                  ),
                   onSaved: (value){
                    usuario  = value;
                  },

                focusNode: this.usuarioFocus,
                onEditingComplete:(){
                  requestFocus(context, passwordFocus);
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
                        focusNode: this.passwordFocus,
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
                           validarFirebase();
                           }
                           else{
                            print('Datos Incorrectos');
                           }
                    },
                  child: Text('Login'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  )
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
                    Navigator.pushNamed(context, 'Registrar');
                  },
                  child: Text('Registrar'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  )
                )
                
                
              ])
              
              )
              ),);
    

  }
void requestFocus(BuildContext context, FocusNode focusNode){
  FocusScope.of(context).requestFocus(focusNode);
}
  @override
  void initState() { 
    super.initState();
    usuarioFocus = FocusNode();
    passwordFocus = FocusNode();
  }
  @override
    void dispose() {
      super.dispose();
      //nombreTextController.dispose();
      //apTextController.dispose();
      usuarioFocus.dispose();
      passwordFocus.dispose();
    }

}

