import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/login/services/login_services.dart';
import 'package:hotlier/AppModules/BottomNavBarModule/presistent_tab_items.dart';
import 'package:hotlier/common/toast.dart';

class LoginViewModel extends GetxController{
final formKey = GlobalKey<FormState>();

final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // final passwordRegex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
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
  final db = FirebaseAuth.instance;
  Future loginWithFirebase() async {
    
    try{
      
    await db.signInWithEmailAndPassword(email: email.text, password: password.text).then((value) => Get.offAll(PresistentBottomBarItems()));
    
    } catch(e){
      return ShowMessage().showErrorMessage('Please Enter Valid Email and Password');
    }
  }

  signOut() async {
    await db.signOut();
  }
}