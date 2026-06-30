import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Account_Login extends StatefulWidget {
  const Account_Login({super.key});

  @override
  State<Account_Login> createState() => _Account_LoginState();
}

class _Account_LoginState extends State<Account_Login> {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text("Create your Account"),
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
            child: TextField(
              controller: confirmpasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your ConfirmPassword",
                labelText: "ConfirmPassword",
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
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Sign up"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
 }
}