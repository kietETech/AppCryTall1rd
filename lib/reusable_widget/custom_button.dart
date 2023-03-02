import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const CustomButon({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(60),
        color: Colors.transparent,
        elevation: 5,
        child: InkWell(
          splashColor: Colors.yellow,
          borderRadius: BorderRadius.circular(60),
          onTap: onPressed,
          child: Ink(
            width: double.infinity,
            height: 60,
            child: Center(
                child: Text(text,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 233, 236, 7),
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
          ),
        ));
  }
}
