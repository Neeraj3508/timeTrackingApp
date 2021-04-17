import 'package:flutter/material.dart';
import 'package:time_tracking_app/app_sign_in/email_signin_form.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.indigo,
          title: Text("Sign In"),
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(child: _buildContent()),
          ),
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      child: EmailSignInForm(),
    );
  }
}
