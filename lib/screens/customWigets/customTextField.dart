import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController _newController = TextEditingController();
  final bool hideText;
  final String textGot;
  CustomTextField({@required bool this.hideText, this.textGot});
  String getText(){
    return _newController.text;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left:32,right: 32),
      constraints: BoxConstraints(maxWidth: 120,maxHeight: 100),
      child: TextField(
        decoration: InputDecoration(hintText:textGot,),
        controller: _newController,
        obscureText: hideText,
      ),
    );
  }
}
