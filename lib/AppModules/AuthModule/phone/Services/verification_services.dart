import 'dart:convert';

import 'package:http/http.dart' as http;
String url = 'https://ab03-110-39-24-146.ap.ngrok.io';
Future oTPVerification({required String phoneNo}) async {
  
try{

     var response = await http.post(Uri.parse('$url/api/verify-code'),
     headers: {
      'Accept': 'application/json'
     },
     body: {
      
      'phone_no' : phoneNo,
      'role' : '0'
      }
    
     );
 
      print(response.body);
     
}
catch (e){
  print(e.toString());
}
 
}