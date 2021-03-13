import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.buttonColor,
    // this.borderRadius: 4.0,
    this.height: 50.0,
    this.callback,
    this.child,
  }) : assert(height != null);
  final Widget child;
  final Color buttonColor;
  // final double borderRadius;
  final double height;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: child,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        onPressed: callback,
      ),
    );
  }
}
