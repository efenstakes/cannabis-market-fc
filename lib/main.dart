import 'package:flutter/material.dart';
import 'package:weed_market/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weed Market',
      theme: ThemeData(
        primaryColor: Color(0xfff519185),
      ),
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}


