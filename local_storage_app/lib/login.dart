import 'package:flutter/material.dart';
import 'package:local_storage_app/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

   SharedPreferences sharedPreferences =  SharedPreferences.getInstance() as SharedPreferences;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              autofocus: true,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                label: Text("Username"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  sharedPreferences.setString("username", usernameController.text);
                  _login(context); },
                child: const Text("Login", style: TextStyle(fontSize: 24)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) => const Welcome());
    Navigator.push(context, pageRoute);

  }
}
