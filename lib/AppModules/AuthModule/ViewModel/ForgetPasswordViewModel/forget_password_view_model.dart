import 'dart:async';

import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/Model/forget_password_model.dart';

class ForgetPasswordViewModel extends GetxController{
  RxInt selectedIndex = 0.obs;
  List<ForgetPasswordModel> forgetList = <ForgetPasswordModel>[
    ForgetPasswordModel(imageUrl: 'assets/auth/coloremail.png', title: 'Email'),
    ForgetPasswordModel(imageUrl: 'assets/auth/colorphone.png', title: 'Phone')
  ];
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
}