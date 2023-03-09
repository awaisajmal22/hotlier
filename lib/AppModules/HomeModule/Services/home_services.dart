import 'dart:convert';

import 'package:http/http.dart' as http;
String url = 'https://ab03-110-39-24-146.ap.ngrok.io';
Future getHomeData() async {
try{
    var responce = await http.get(Uri.parse('$url/api/category'));
  var result = json.decode(responce.body);
  print(result);
} catch(e){
  print(e.toString());
}

}