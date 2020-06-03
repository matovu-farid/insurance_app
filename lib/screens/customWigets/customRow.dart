import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final _controller = TextEditingController();
  final TextInputType textInputType;

  final bool obscureText1 ;
  final Icon icon;
  final String error;
  final String hint;
  final FormFieldValidator validate;
  CustomRow(
      {@required this.title,
      this.obscureText1,
      this.icon,
       this.error,
      this.hint,
      this.validate,
         this.textInputType});

  String get getText => _controller.text;

  bool get returnObscure => obscureText1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              autofocus: false,

              textInputAction: TextInputAction.done,
              maxLines: 2,
              minLines: 1,
              enableSuggestions: true,
              toolbarOptions: ToolbarOptions(copy: true,cut: true,paste: true,selectAll: true),
              smartDashesType: SmartDashesType.enabled,
              smartQuotesType: SmartQuotesType.enabled,
              maxLengthEnforced: true,
              cursorColor: Colors.greenAccent,



              keyboardType: textInputType,

              autovalidate: true,

              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.green,decorationStyle: TextDecorationStyle.wavy),
                enabled: true,
                filled: true,

                labelText: title,
                hintText: hint,
                isDense: true,


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
