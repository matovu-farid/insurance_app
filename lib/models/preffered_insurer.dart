import 'dart:async';

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
}
