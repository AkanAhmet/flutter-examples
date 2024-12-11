import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State createState() => _LoginRegisterPage();
}

class _LoginRegisterPage extends State {

  Future<void> createUser() async {
    try{
      await Auth().createUser(email: emailController.text.toString(), password: passwordController.text.toString());
    }
    on FirebaseAuthException  catch(exception) {
      setState(() {
        errorMessage= exception.message;
        print("$errorMessage, ${exception.code}");
      });
        }
  }

  Future<void> signIn() async{
    try {
      await Auth().signIn(
          email: emailController.text, password: passwordController.text);
    }
    on FirebaseAuthException catch(exception){
      setState(() {
        errorMessage = exception.message;
        print(errorMessage);
      });

    }

  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLogin = true;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              errorMessage != null
                  ? Text(errorMessage!)
                  : const SizedBox.shrink(),
              ElevatedButton(
                onPressed: () {
                  if(isLogin) {
                    signIn();
                  }
                  else {
                    createUser();
                  }
                },
                child: isLogin ? const Text("Login") : const Text("Register"),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      isLogin = !isLogin;
                    },
                  );
                },
                child: isLogin ? const Text("Henüz hesabın yok mu? Tıkla") : const Text("Giriş Yap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
