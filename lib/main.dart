import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_new/homae_screen.dart';

void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}



