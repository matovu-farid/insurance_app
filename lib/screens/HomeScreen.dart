import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(),
      body: Container(padding: EdgeInsets.all(32.0),
      child: Center(
        child: Text("Thank you \n We'll be getting back to you in no time"),

      ),),
    ),);
  }

}