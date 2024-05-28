import 'package:flutter/material.dart';
import 'package:gallery/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2CAB00),
        fontFamily: 'Sen',
      ),
      home: HomePage(),
    );
  }
}
