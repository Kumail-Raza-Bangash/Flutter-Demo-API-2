import 'package:flutter/material.dart';
import 'package:flutter_demo_api_2/home_page.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(  
          primarySwatch: Colors.yellow,  
        ),
      home: Scaffold(
      appBar: AppBar(
        title: const Text(" Flutter Demo API 2 "),
      ),
      body: const HomePage(),
      ),
      
    );
  }
}