import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/pages/login_register_page.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch(e) {  print("Firebase start exception");}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginRegisterPage(),
    );
  }
}
