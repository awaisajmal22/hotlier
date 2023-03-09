import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotlier/AppModules/AuthModule/signup/Services/signup_services.dart';
import 'package:hotlier/AppModules/BottomNavBarModule/presistent_tab_items.dart';
import 'package:hotlier/common/loadingIndicator.dart';
import 'package:hotlier/common/toast.dart';

class SignUpViewModel extends GetxController{
final formKey = GlobalKey<FormState>();
final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordRegex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final name = TextEditingController();
  final confirmPassword = TextEditingController();

  RxString selectedUser = 'Login as User'.obs;
  RxBool obsecure = true.obs;
  RxBool obsecure2 = true.obs;
RxBool check = false.obs;
    checkPassword(){
    obsecure.value = !obsecure.value;
    update();
  }
  checkConfirmPassword(){
    obsecure2.value = !obsecure2.value;
    update();
  }
  List selectTypeList = [
    'Signup as User',
    'Signup as seller',
    'Signup as Professionals',
  ];
  RxInt selectedIndex = 0.obs;

  final TextEditingController phoneController = TextEditingController();
RxBool isValid = false.obs;
   Timer? timer;
  int remainingSeconds = 0;
  final time = '00:00'.obs;
  // @override
  // void onReady() {
  //   startTimer(120);
  //   super.onReady();
  // }
  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds < 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2,'0')}";
        remainingSeconds--;
      }
    });
  }
  RxString userCountryCode = '92'.obs;
  // void onChange(CountryCode countryCode) {
  //   userCountryCode.value = countryCode.toString();

  //   print('Country Selected' + countryCode.toString());
  // }
  bool validatePhoneNumber(String phone) {
  // The regular expression for a valid phone number
  final RegExp regex = RegExp(r'^\+?[\d\s]{10,}$');
  
  // Check if the phone number matches the regular expression
  return regex.hasMatch(phone);
}

Future<String?> onSignUp() async {
  String? isSuccess = await register(
    name: name.value.text, 
    email: email.value.text, 
    password: password.value.text, 
    role: selectedUser.value,
    userName: username.value.text, phoneNo: userCountryCode.value + phoneController.text.toString());

    return isSuccess;
}



signUpWithGoogle(BuildContext context) async {
  final GoogleSignInAccount? googleUser = await  GoogleSignIn(scopes: <String>['email']).signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
  showLoadingIndicator(context: context);
  if(FirebaseAuth.instance.currentUser!.displayName != null){
    var data = await onSocialSignUp(
      name: FirebaseAuth.instance.currentUser!.displayName!, 
      email: FirebaseAuth.instance.currentUser!.email!, uid: FirebaseAuth.instance.currentUser!.uid, platform: 'Google', role: selectTypeList[selectedIndex.value]);
    if(data == 'success'){
      // ignore: use_build_context_synchronously
      hideOpenDialog(context: context);
      Get.offAll(PresistentBottomBarItems());
    } else {
      ShowMessage().showErrorMessage(data.toString());
    }
  }
}

Future<UserCredential> signinWithFacebook(BuildContext context) async {

  final LoginResult loginResult = await FacebookAuth.instance.login(
    permissions: [
      'email',
      'public_profile',
      'user_birthday',
    ]
  );
  final OAuthCredential fbAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  showLoadingIndicator(context: context);
  final data = await FacebookAuth.instance.getUserData();
  if(data['email'] != null){
    var value = await onSocialSignUp(name: data['name'], email: data['email'], uid: data['id'], platform: 'Facebook', role: selectTypeList[selectedIndex.value]);
    if(value == 'success'){
      hideOpenDialog(context: context);
      Get.offAll(PresistentBottomBarItems());
    } else {
      ShowMessage().showErrorMessage(value.toString());
    }
    hideOpenDialog(context: context);
  }
  var email = data['email'];
  return FirebaseAuth.instance.signInWithCredential(fbAuthCredential);
}
}