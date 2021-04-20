import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pruebafirebase/src/utils/app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
  runApp(MyApp());
  });
}
