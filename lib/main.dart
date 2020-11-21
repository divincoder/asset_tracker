import 'package:flutter/material.dart';
import 'package:shared/env.dart';
import 'package:spending_tracker/auth/login_screen.dart';

import './demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static final String _pkg = 'spending_tracker';

  static String get pkg => Env.getPackage(_pkg);

  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}
