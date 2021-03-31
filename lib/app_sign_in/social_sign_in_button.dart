import 'package:flutter/material.dart';
import 'package:time_tracking_app/custom_widget/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(assetName != null),
        assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                assetName,
                width: 30.0,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              SizedBox(
                width: 30.0,
              )
            ],
          ),
          buttonColor: color,
          callback: onPressed,
        );
}
