import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/login/View/login_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';

logoutDailog(
  BuildContext context
){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: appText(text: 'Are You Sure ?', textColor: AppColor.textBlack, fontSize: 20),
      actions: [
        
        TextButton(
          onPressed: (){
            Get.back();
          },
          child: appText(text: 'No', textColor: AppColor.textBlack, fontSize: 15),
        ),
        TextButton(
         onPressed: (){
            Get.offAll(LoginView());
          },
          child: appText(text: 'Yes', textColor: AppColor.textBlack, fontSize:  15),
        ),
      ],
    );
  });
}