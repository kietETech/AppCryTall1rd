import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class ButtonIcon extends StatelessWidget {
  final bool chooseIcon;
  final String? text;
  final Function onClick;
  const ButtonIcon(
      {super.key, required this.chooseIcon, this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      //color: Colors.blue,
      child: SignInButton(
        chooseIcon ? Buttons.Google : Buttons.Facebook,
        onPressed: () {},
        text: text,
      ),
    );
  }
}
