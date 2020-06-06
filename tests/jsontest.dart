import 'package:family/jsontry.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
void main(List<String> args){
  const json  ="""{
    "name": "Farid",
    "age": "23",
    "Gender": "Male",
    "course": "civil"
  }""";
  test("testing json", () async{
    expect(parseJson(json).first["name"],"Farid" );
   
  });
}

