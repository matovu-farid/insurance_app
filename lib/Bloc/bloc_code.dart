import 'dart:async';

import 'package:family/models/preffered_insurer.dart';

class Bloc{
  StreamSubscription _subscription;
  Bloc(){

     _subscription = fromList().listen((event)=> _sink.add(event),
        cancelOnError: false,
        onError: (error)=> {print('Error got : $error'),

        },
        onDone: (){_controller.close();}
    );
  }
  //fetch the list
  List<String> get list=>PreferedInsurer().prefferedInsList;

  //Generate insurer stream
  Stream<String> fetchInsurer(List<String> list) async*{
   Iterator iterator = list.iterator;
   while(iterator.moveNext()) {
    yield await Future.delayed(Duration(seconds: 1),()async{return  await iterator.current;});

   }

  }




  //creating the stream and sink
 StreamController<String> _controller = StreamController();
 StreamSink<String> get _sink =>_controller.sink;
 Stream<String> get stream => _controller.stream;


 //get fromList
  Stream<String> fromList() {
    return fetchInsurer(list);
  }




}