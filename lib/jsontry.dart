import 'dart:convert';


 class JsonTry{
   Map<String,String> parseJson(String jsonStr){
    final parsed = json.decode(jsonStr);
    final details = Map<String,String>.from(parsed);
    return details;
  }

}