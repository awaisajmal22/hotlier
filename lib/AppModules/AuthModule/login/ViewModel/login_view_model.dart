import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/login/services/login_services.dart';

class LoginViewModel extends GetxController{
final formKey = GlobalKey<FormState>();

final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordRegex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  RxBool obsecure = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  checkPassword(){
    obsecure.value = !obsecure.value;
    update();
  }

  Future<bool?> onLogin() async {
    bool? isSuccess = await login(email: email.value.text, password: password.value.text);
    return isSuccess;
  }
}