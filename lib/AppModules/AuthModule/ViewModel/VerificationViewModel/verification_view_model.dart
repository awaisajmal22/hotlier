import 'dart:async';

import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationViewModel extends GetxController{
  final TextEditingController phoneController = TextEditingController();

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
  RxString userCountryCode = '+92'.obs;
  void onChange(CountryCode countryCode) {
    userCountryCode.value = countryCode.toString();

    print('Country Selected' + countryCode.toString());
  }
}