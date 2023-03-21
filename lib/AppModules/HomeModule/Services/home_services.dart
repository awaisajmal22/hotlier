import 'dart:convert';

import 'package:hotlier/Network/api_services.dart';
import 'package:hotlier/Network/api_url.dart';
import 'package:http/http.dart' as http;
String url = 'https://ab03-110-39-24-146.ap.ngrok.io';
Future<String?> getHomeData() async {
String? isSuccess;
try{
    var responce = await API().getRequest(ApiUrl.getCategory);
  var result = json.decode(responce);
  print(result);
} catch(e){
  print(e.toString());
}
return isSuccess;
}