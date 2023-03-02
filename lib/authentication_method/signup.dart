import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUser_method {
  CreateUser_method(TextEditingController emailController,
      TextEditingController passWordController);

  Future<void> createUser(TextEditingController emailController,
      TextEditingController passWordController) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passWordController.text,
    );
    // return userCredential;
  }
}
