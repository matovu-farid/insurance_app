import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final _controller = TextEditingController();

  bool obscureText1 = false;
  final Icon icon;
  final String error;
  final String hint;

  CustomRow(
      {@required this.title,
      this.obscureText1,
      this.icon,
      this.error,
      this.hint});

  String get getText => _controller.text;

  bool get returnObscure => obscureText1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              autovalidate: true,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.green),
                enabled: false,
                filled: true,


                labelText: title,

                hintText: hint,

                prefixIcon: icon ??
                    SizedBox(
                      width: 10,
                    ),
              floatingLabelBehavior: FloatingLabelBehavior.auto),
              obscureText: returnObscure,
              controller: _controller,
            ),
          )
        ],
      ),
    );
  }
}
