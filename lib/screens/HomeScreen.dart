

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.backspace), onPressed: ()=>Navigator.pushNamed(context, "/SignUp")),
          backgroundColor: Colors.grey[800],
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Text("Thank you. \n \n We'll get back to you in no time"
          ,style: TextStyle(color: Colors.green[800],fontSize:22),))
        ),
      ),
    );
  }
}


