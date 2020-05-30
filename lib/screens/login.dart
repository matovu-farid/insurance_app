
import 'package:family/app.dart';
import 'package:family/screens/customWigets/customText.dart';
import 'package:family/screens/customWigets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {



  static CustomTextField userNameTextField = CustomTextField(hideText: false,textGot: "Enter Username",);
  static CustomTextField passwordTextField = CustomTextField(hideText: true);
  static String userName = userNameTextField.getText();
  static String passWord = passwordTextField.getText();

  Widget screenState;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(22),
        child: Column(
          children: <Widget>[
            Row(mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomText("User Name"),
                userNameTextField,

              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                CustomText("Password"),

                passwordTextField,
              ],
            ),
            SizedBox(height: 20,),
            FloatingActionButton.extended(
              onPressed: buttonPressed,
              label: CustomText("Login"),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  void buttonPressed() {

  }
}
