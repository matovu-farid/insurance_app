import 'package:family/screens/HomeScreen.dart';
import 'package:family/screens/login.dart';
import 'package:family/screens/sign_up.dart';
import 'package:family/screens/starting_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/Home": (context) => Home(),
        "/SignUp": (context) => Signup(),
        "/Login": (context) => Login(),
        "/StartingScreen":(context)=>StartingScreen(),

      },
      home: StartingScreen(),
    );
  }
}

