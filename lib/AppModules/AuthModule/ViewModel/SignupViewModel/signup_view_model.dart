import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController{
final formKey = GlobalKey<FormState>();
final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  final passwordRegex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  RxString selectedUser = 'Login as User'.obs;
  RxBool obsecure = true.obs;
RxBool check = false.obs;
    checkPassword(){
    obsecure.value = !obsecure.value;
    update();
  }
 List selctUserList = [
  'Login as Seller / Buyer',
  'Login as Professionals',
 ];

}