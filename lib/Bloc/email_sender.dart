import 'package:family/models/client.dart';
import 'package:family/models/emails_of_bosses.dart';
import 'package:family/screens/sign_up.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class CustomEmailSender {
  ClientData clientdata;
  CustomEmailSender(this.clientdata);
  String  body() {
    return "Client name :" ;
  }
  // send email
Future<void> send() async {
    final Email email = Email(
      body: clientdata.toString(),
      subject: "New Prospect",
      recipients: [...EmailOfBosses.emailList],
      attachmentPaths:[],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
}
}