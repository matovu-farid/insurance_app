import 'dart:async';

import 'client.dart';

class ClientList{
  static List<ClientData> clientList=List<ClientData>();


  StreamController _controller = StreamController();

  Stream _stream;



  add(ClientData client) =>clientList.add(client);
  remove(ClientData client){
    if(clientList.contains(client))clientList.remove(client);
  }
}