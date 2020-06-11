import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/models/client.dart';

class PreferedInsurer {
  List<String> _prefferedInsList = List<String>();

  PreferedInsurer(){
    _prefferedInsList.addAll([
      "Jubilee insurance",
      "UAP insurance"
          "Case medcare insurance",
      "Sanlam life insurance",
      "IAA Insurance",
      "Liberty Insurance",
      "AAR Insurance",
      "St Catherine Insurance",
      "International medical link"
      "Life Link"
    ]);
  }

  List<String> get prefferedInsList => _prefferedInsList;
  Firestore _firestore = Firestore.instance;
  sendingInsurers (){
    for(int i;i<_prefferedInsList.length;i++){
      _firestore.collection("Preferred Insurer").document('${_prefferedInsList[i]}');
    }
  }


  }





