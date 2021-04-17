import 'package:flutter/material.dart';
import 'package:time_tracking_app/custom_widget/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          callback: onPressed,
          buttonColor: Colors.indigo,
          height: 44,
        );
}
