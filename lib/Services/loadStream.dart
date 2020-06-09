import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/models/client.dart';
import 'package:family/models/preffered_insurer.dart';
import 'package:family/screens/sign_up.dart';
import 'package:flutter/material.dart';


Firestore firestore = Firestore.instance;

//get loadingData{
//
//}

sendingToDataBase(ClientData client,String uid){
  
  firestore.collection("users").document(uid).setData(client.clientInfo);
 
}
//simulation of loading from database preferred insurer
Stream<List<String>> loadInsurer ()async*{
  List<String> list = List<String>();
  for (String insurer in PreferedInsurer().prefferedInsList){
    await Future.delayed(Duration(seconds: 1));
    list.add(insurer);
    yield list;
  }
}


Stream<DropdownMenuItem> loadSingle ()async*{
  final list =PreferedInsurer().prefferedInsList;
  for (String insurer in list){

   yield  DropdownMenuItem(child: Text(insurer),value: Text(insurer),);

  }
}
Future<List<DropdownMenuItem>> get listGot async=>  await loadSingle().toList();
final _controller = StreamController();
Stream<DropdownMenuItem> _stream =_controller.stream;
Stream<DropdownMenuItem> streamProduced()async*{
  DropdownMenuItem dropdownMenuItem;

 loadSingle().listen((event)=>event=dropdownMenuItem);
yield dropdownMenuItem;

  }


