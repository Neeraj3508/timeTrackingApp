import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeTrackingApp/app_sign_in/sign_in_button.dart';
import 'package:timeTrackingApp/app_sign_in/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      print('${userCredentials.user.uid}');
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 2.0,
          title: Text("Time Tracker App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 48.0,
              ),
              SocialSignInButton(
                assetName: 'assets/google.png',
                color: Colors.white,
                textColor: Colors.black,
                text: "Sign In with Google",
                onPressed: () {},
              ),
              SizedBox(
                height: 8.0,
              ),
              SocialSignInButton(
                assetName: 'assets/facebook.png',
                color: Colors.indigo,
                text: "Sign In with Facebook",
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(
                height: 8.0,
              ),
              SignInButton(
                text: "Sign in with Email",
                buttonColor: Colors.teal,
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: 16.0),
              Text(
                "or",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              SignInButton(
                text: "Go Anonymously",
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: _signInAnonymously,
              )
            ],
          ),
        ),
      ),
    );
  }
}
