import 'package:flutter/material.dart';
import 'pages/Home.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Owner Application',
      home: Home(),

      theme: ThemeData(
        primaryColor: Color(0XFF001133),
        accentColor: Color(0XFF0044cc),
      ),

 
    )
  );
}