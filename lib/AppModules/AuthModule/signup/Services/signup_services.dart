import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hotlier/Network/api_services.dart';
import 'package:hotlier/Network/api_url.dart';
import 'package:hotlier/common/Storage/storage_handler.dart';
import 'package:hotlier/common/loadingIndicator.dart';
import 'package:hotlier/common/toast.dart';

Future<String?> register({required String name, required String email ,required String password,required String userName ,required String phoneNo, required String role}) async {
  String? isSuccess;
try{
  var data = {
    'name' : name,
      'username' : userName,
      'email' : email,
      'password' : password.replaceAll(" ", ''),
      'phone_no' : phoneNo,
      'role' : role
  };
     var response = await API().postRequest(ApiUrl.signupUrl, data);
    print(response.data);
      if(response == null){
        
      } else if(response.data['status'] == 'success'){
        GetStorageHandler getStorageHandler = GetStorageHandler();
        isSuccess = response.data['status'];
        await getStorageHandler.setToken(response.data['authorisation']['token']);
        

      }
      return isSuccess;
     
}
catch (e){
  print(e.toString());
}
 
}

Future<String?> onSocialSignUp({
  required String name,
  required String email,
  required String uid,
  required String platform,
  required String role
}) async {
String? isSuccess; 
try{
  var data = {
    'email': email,
    'uid': uid,
    'platform': platform,
    'name': name,
    'role': role
  };

  var responce = await API().postRequest(ApiUrl.socialLoginUrl, data);
  if(responce == null){

  }else if(responce.data['status'] =='success'){
    GetStorageHandler getStorageHandler = GetStorageHandler();
    isSuccess = responce.data['status'];
    await getStorageHandler.setToken(responce.data['authorisation']['token']);
    ShowMessage().showMessage(responce.data['message'].toString());
  }
  else {
    ShowMessage().showErrorMessage(responce.data["message"].toString());
  }
} catch(e){
  return isSuccess;
}
}



