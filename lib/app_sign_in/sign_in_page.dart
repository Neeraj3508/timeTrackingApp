import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracking_app/app_sign_in/email_signin_page.dart';
import 'package:time_tracking_app/app_sign_in/sign_in_button.dart';
import 'package:time_tracking_app/app_sign_in/social_sign_in_button.dart';
import 'package:time_tracking_app/custom_widget/show_exception_alert_dialog.dart';
import 'package:time_tracking_app/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseAuthException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: "Sign In Failed",
      exception: exception,
    );
  }

  bool _isLoading = false;
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      // print("in anonymous signin");
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } catch (error) {
      _showSignInError(context, error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } catch (error) {
      _showSignInError(context, error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
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
          SizedBox(
            height: 50,
            child: _buildHeader(),
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
            onPressed: () => _isLoading ? null : _signInWithGoogle(context),
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
            onPressed: () => _isLoading ? null : _signInWithEmail(context),
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
            onPressed: () => _signInAnonymously(context),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      "Sign In",
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
