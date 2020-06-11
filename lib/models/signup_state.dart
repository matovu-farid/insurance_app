import 'package:family/models/age_bracket.dart';
import 'package:family/models/insurance_typ.dart';
import 'package:family/models/preffered_insurer.dart';
import 'package:family/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'insurance_category.dart';

enum Gender { MALE, FEMALE }

class SignupModel extends Model {
  InsuranceCategory category;
  PreferedInsurer prefferedInsurer;
  InsurancetypList insTyp;

  String categoryName;
  String preferredInsurerName;
  String insuranceTypeName;
  String ageBracket;

  List<String> categoryList;
  List<String> insuranceTypeList;
  List<String> preferredInsurerList;
  List<String> ageBracketList;

  List<DropdownMenuItem<String>> catList;
  List<DropdownMenuItem<String>> prefferedInsDropList;
  List<DropdownMenuItem<String>> typDropList;
  List<DropdownMenuItem<String>> ageDropBracket;

  int commonRadio = 0;

  var genderMapper = {Gender.MALE: 0, Gender.FEMALE: 1};
  final Map<int, String> genderMapped = {0: "MALE", 1: "FEMALE"};

  var signupInsantance = Signup();

  String getGender() {
    return genderMapped[commonRadio];
  }

  onchange() {
    if (commonRadio == 0)
      commonRadio = 1;
    else
      commonRadio = 0;
    notifyListeners();
  }

  onCategoryChanged(String newCategory) => categoryName = newCategory;

  onPrefferdChanged(String newPreffed) => preferredInsurerName = newPreffed;

  onTypeChanged(String newType) => insuranceTypeName = newType;

  onAgeChanged(String age) => ageBracket = age;

  //category
  static List<DropdownMenuItem<String>> catListHelper(
          List<String> categoryList) =>
      categoryList
          .map((itemName) => DropdownMenuItem(
              value: itemName,
              child: Text(
                itemName,
                textAlign: TextAlign.center,
              )))
          .toList();

  static List<String> get categoryListHelper =>
      InsuranceCategory().categoryList;

  //insurer

  static List<DropdownMenuItem<String>> prefferedtHelper(
          List<String> preferredInsurerList) =>
      preferredInsurerList
          .map((typeName) => DropdownMenuItem(
                value: typeName,
                child: Text(typeName),
              ))
          .toList();

  static List<String> get preffredListHelper =>
      PreferedInsurer().prefferedInsList;

//  Type

  static List<DropdownMenuItem<String>> typetHelper(
          List<String> insuranceTypeList) =>
      insuranceTypeList
          .map((typeName) => DropdownMenuItem(
                value: typeName,
                child: Text(typeName),
              ))
          .toList();

  static List<String> get typeListHelper => InsurancetypList().insuranceList;

  //age bracket
  static List<DropdownMenuItem<String>> ageHelper(
          List<String> ageBracketList) =>
      ageBracketList
          .map((age) => DropdownMenuItem(
                value: age,
                child: Text(age),
              ))
          .toList();

  static List<String> get ageListHelper => AgeBracket().ageBracketList;

  SignupModel()
      :
        //category of insurer
        categoryList = categoryListHelper,
        catList = catListHelper(categoryListHelper),
        categoryName = categoryListHelper[0],

        //prefferred insurer
        preferredInsurerList = preffredListHelper,
        prefferedInsDropList = prefferedtHelper(preffredListHelper),
        preferredInsurerName = preffredListHelper[0],

//type of insurance
        insuranceTypeList = typeListHelper,
        typDropList = typetHelper(typeListHelper),
        insuranceTypeName = typeListHelper[0],

        //age bracket
        ageBracketList = ageListHelper,
        ageDropBracket = ageHelper(ageListHelper),
        ageBracket = ageListHelper[0];
}
