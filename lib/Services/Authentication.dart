import 'package:firebase_auth/firebase_auth.dart';
class Authorization{
  FirebaseUser _user;
 

FirebaseAuth _authorization = FirebaseAuth.instance;
Future anonSignIn()async{
  
  try {
    AuthResult result =  await _authorization.signInAnonymously();
    FirebaseUser firebaseUser =  result.user;
    return firebaseUser;
  } on Exception catch (e) {
     print('Error that ocurred : ${e.toString()}');
     return null;
  }
}

  
}



