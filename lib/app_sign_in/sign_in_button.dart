import 'package:flutter/material.dart';
import 'package:timeTrackingApp/custom_widget/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color buttonColor,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          buttonColor: buttonColor,
          callback: onPressed,
          height: 50.0,
        );
}
