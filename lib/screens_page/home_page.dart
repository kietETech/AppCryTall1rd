import 'package:app_crytall_1rd/model/get_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:app_crytall_1rd/model/networdk_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GetAPI> postData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetchData().then((value) {
      setState(() {
        postData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login With Facebook')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, item) {
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${postData[item].title}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.amberAccent),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${postData[item].body}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
                return null;
              },
              itemCount: postData.length,
            ),
          ),
          Center(
              child: ElevatedButton(
            child: const Text('Logout'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await FacebookAuth.instance.logOut();
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
