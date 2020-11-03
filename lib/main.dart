import 'package:flutter/material.dart';
import 'inputpage.dart';

void main(){
  runApp(Bmi());
}
class Bmi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage() ,
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}