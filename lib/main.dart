import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracking_app/app_sign_in/landing_page.dart';
import 'package:time_tracking_app/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: Colors.indigo));

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
