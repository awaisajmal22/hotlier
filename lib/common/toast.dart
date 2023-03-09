import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_color.dart';


class ShowMessage {
  showMessage(
    
    String message,
  ) {
    return Get.snackbar(
      "Success".tr,
      message.tr,
      // icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.white,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),

      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 200),
      isDismissible: true,
      forwardAnimationCurve: Curves.linear,
    );
  }

  showErrorMessage(String message) {
    if (Get.isSnackbarOpen == false) {
      return Get.snackbar(
        "Error".tr,
        message.tr,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 200),
        isDismissible: true,
        forwardAnimationCurve: Curves.linear,
      );
    }
  }
}