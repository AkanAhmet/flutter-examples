import 'package:flutter/material.dart';

import 'package:local_storage_app/login.dart';

void main() {

  runApp( Home());
}
class Home extends StatelessWidget {

  Home({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Login(),
    );
  }

}