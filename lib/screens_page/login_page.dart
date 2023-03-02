import 'package:app_crytall_1rd/reusable_widget/custom_button.dart';
import 'package:app_crytall_1rd/screens_page/home_page.dart';
import 'package:app_crytall_1rd/uitlls/collor_utills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_crytall_1rd/reusable_widget/reusable_widget.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("757575"),
            hexStringToColor("CDB380"),
            hexStringToColor("000000")
          ], begin: Alignment.center, end: Alignment.bottomCenter)),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    ReusableTextFormField(
                      'Enter your email',
                      Icons.email,
                      false,
                      emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReusableTextFormField(
                      'Enter your password',
                      Icons.lock_open,
                      true,
                      passWordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButon(
                        text: 'Login with email',
                        onPressed: () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passWordController.text,
                              )
                              .then((value) => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()))
                                  });
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    otherLogin('------------------- or ------------------'),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var result = await signInWithGoogle();
                          if (result.user != null) {
                            print('gg');
                            print(result.user!.displayName);
                            print(result.user!.email);
                            print(result.user!.displayName);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const HomePage()));
                          } else {
                            const snackBar = SnackBar(content: Text('Error'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text('Login with Google')),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var result = await signInWithFacebook();
                          if (result.user != null) {
                            print('fb');
                            print(result.user!.displayName);
                            print(result.user!.email);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const HomePage()));
                          } else {
                            const snackBar = SnackBar(content: Text('Error'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text('Login facebook')),
                    const SizedBox(
                      height: 30,
                    ),
                    signUpOption(context),
                    const SizedBox(
                      height: 13,
                    ),
                  ]),
            ),
          ])),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
