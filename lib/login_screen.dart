import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'account_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text("Login to your Account"),
       centerTitle: true,
    ),
     body: SizedBox(
     width: double.infinity,
     child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Email",
                labelText: "Email",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Password",
                labelText: "Password",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                 if (emailController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter Your Email");
                } else if (passwordController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter Your Password");
                } else {
                  Fluttertoast.showToast(msg: "Login Successfully");

                Navigator.push(
                 context,
                  MaterialPageRoute(
                   builder: (context) => const Account_Login(),
                  ),
               );
               }
             },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Sign In"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
 }
}