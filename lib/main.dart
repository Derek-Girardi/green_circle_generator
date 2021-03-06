import 'package:flutter/material.dart';
import 'package:green_circle_generator/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Circle Generator',
      theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
          canvasColor: Colors.transparent
      ),
      home: HomePage(),
    );
  }
}





