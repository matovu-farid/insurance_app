import 'dart:convert';



   List<Map<String,String>> parseJson(String jsonStr){
    final parsed = json.decode(jsonStr);
    final details =List< Map<String,String>>.from(parsed);
    return details;
  }

