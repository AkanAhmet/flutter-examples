import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {

  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    SharedPreferences sharedPreferences =  SharedPreferences.getInstance() as SharedPreferences;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Text("Welcome ${sharedPreferences.getString("username")}", style: const TextStyle(fontSize: 24),),
      ),
    ));
  }
}
