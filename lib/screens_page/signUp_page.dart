import 'package:app_crytall_1rd/reusable_widget/reusable_widget.dart';
import 'package:app_crytall_1rd/screens_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_crytall_1rd/uitlls/collor_utills.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userlController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.8),
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FFCFCFCF"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.center, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ReusableTextFormField('Enter email name', Icons.person_outline,
                    false, emailController),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextFormField('Enter password name', Icons.lock_outline,
                    false, passWordController),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        await createUser(emailController, passWordController);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } catch (e) {
                        print('Loi dang ky emai $e');
                      }
                    },
                    child: const Text('Sign In'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void> createUser(TextEditingController emailController,
//     TextEditingController passWordController) async {
//   try {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: emailController.text,
//       password: passWordController.text,
//     );
//     print('Tạo tài khoản thành công');
//   } catch (e) {
//     print('Lỗi: $e');
//   }
// }

Future<void> createUser(TextEditingController emailController,
    TextEditingController passWordController) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passWordController.text,
  );
  // return userCredential;
}
