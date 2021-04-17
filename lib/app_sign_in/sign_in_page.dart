import 'package:flutter/material.dart';
import 'package:time_tracking_app/app_sign_in/email_signin_page.dart';
import 'package:time_tracking_app/app_sign_in/sign_in_button.dart';
import 'package:time_tracking_app/app_sign_in/social_sign_in_button.dart';
import 'package:time_tracking_app/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (error) {
      print(error);
    }
  }

  // Future<void> _signInWithFacebook() async {
  //   try {
  //     await auth.signInWithFacebook();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
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
        body: _buildContent(context),
      ),
    );
  }

  Padding _buildContent(BuildContext context) {
    return Padding(
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
            // onPressed: () {},
            onPressed: _signInWithGoogle,
          ),
          SizedBox(
            height: 8.0,
          ),
          // SocialSignInButton(
          //   assetName: 'assets/facebook.png',
          //   color: Colors.indigo,
          //   text: "Sign In with Facebook",
          //   textColor: Colors.white,
          //   onPressed: () {},
          //   // onPressed: _signInWithFacebook,
          // ),
          // SizedBox(
          //   height: 8.0,
          // ),
          SignInButton(
            text: "Sign in with Email",
            buttonColor: Colors.teal,
            textColor: Colors.white,
            onPressed: () => _signInWithEmail(context),
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
    );
  }
}
