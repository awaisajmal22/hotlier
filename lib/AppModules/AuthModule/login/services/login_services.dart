import 'package:hotlier/Network/api_url.dart';
import 'package:hotlier/common/Storage/storage_handler.dart';
import 'package:hotlier/common/toast.dart';

import '../../../../Network/api_services.dart';

Future<bool?> login({required String email, required String password}) async{
bool? isSuccess = false;
try{
  var data = {
    'email': email,
    'password': password
  };
  var responce = await API().postRequest(ApiUrl.loginUrl, data);
  print(ApiUrl.loginUrl);
  print(responce);
  if(responce == null){
    print('error is there');
  }else if(responce.data['success'] == true){
    GetStorageHandler storageHandler = GetStorageHandler();
    isSuccess = responce.data['success'];
    await storageHandler.setToken(responce.data['token']);
    ShowMessage().showMessage(responce.data['message'].toString());
  }
  else {
    ShowMessage().showErrorMessage(responce.data['message'].toString());
  }
}catch (e){
  
}
return isSuccess;
}