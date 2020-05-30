import 'package:flutter/cupertino.dart';

class InsuranceCategory {
   List<String> _categoryList = List<String>();

  InsuranceCategory(){
    _categoryList.add("Individual");
    _categoryList.add("Family");
    _categoryList.add("Cooperate");
    _categoryList.add("Maternity Cover");
    _categoryList.add("Other");
  }


   List<String> get categoryList => _categoryList;



}