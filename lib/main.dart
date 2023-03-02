import 'package:app_crytall_1rd/screens_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyDp1eOlu8wymr4ndy4vErvsRN-F0dEY4lY',
            appId: '1:977189501842:android:fd803ad7c112f6e79c9f4b',
            messagingSenderId: '977189501842',
            projectId: 'appcrytall1rd'));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
