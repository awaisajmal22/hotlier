import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController{
final formKey = GlobalKey<FormState>();

final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  final passwordRegex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  RxBool obsecure = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  checkPassword(){
    obsecure.value = !obsecure.value;
    update();
  }

  
}