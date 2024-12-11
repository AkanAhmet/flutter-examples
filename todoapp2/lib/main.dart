import 'package:flutter/material.dart';
import 'package:todoapp2/screens/home.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: HomeScreen(),
    );
  }
}
