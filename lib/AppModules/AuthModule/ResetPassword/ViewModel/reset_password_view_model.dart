import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordViewModel extends GetxController{
  RxBool check1 = true.obs;
  RxBool check2 = true.obs;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordRegex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  final formKey = GlobalKey<FormState>();
}