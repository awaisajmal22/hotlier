import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/ForgetPassword/ViewModel/forget_password_view_model.dart';
import 'package:hotlier/AppModules/AuthModule/signup/ViewModel/signup_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';
import 'package:path/path.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/app_button.dart';
import '../../../../BottomNavBarModule/presistent_tab_items.dart';

class customDailog extends StatelessWidget {
   customDailog({super.key, required this.title, required this.subtitle, required this.time,});
  String title;
  String subtitle;
  String time;
  final verifcationPasswordVM = Get.put(SignUpViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27)
        ),
        child: Container(
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 55.48,
                offset: const Offset(0, 13.32),
                color: const Color(0xff251F30).withOpacity(0.05)
              )
            ],
            color: AppColor.white
          ),
          alignment: Alignment.center,
          height: SizeConfig.heightMultiplier * 60,
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 40),
          child: Column(
            
            children: [
              Align(
                alignment: Alignment.center,
                child: appText(text:"Verify $title", textColor: AppColor.textBlack, fontSize: 22, fontweight: FontWeight.w700)),
              const SizedBox(
                height: 11,
              ),
              Align(
                alignment: Alignment.center,
                child: appText(text: 'We Have Sent Code To Your $title', textColor: AppColor.lightgrey, fontSize: 14, fontweight: FontWeight.w400)),
              const SizedBox(
                height: 39,
              ),
              Align(
                alignment: Alignment.center,
                child: appText(text: subtitle, textColor: AppColor.lightgrey, fontSize: 14, fontweight: FontWeight.w400)),
              const SizedBox(
                height: 29,
              ),
              PinCodeTextField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter Your Code";
                  }
                  return null;
                },
                showCursor: true,
                cursorColor: AppColor.cyan,
                textStyle: const TextStyle(
                  color: AppColor.cyan
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: SizeConfig.heightMultiplier * 7.5,
                  fieldWidth: SizeConfig.widthMultiplier * 15,
                  borderRadius: BorderRadius.circular(13),
                  activeFillColor: AppColor.white,
                  selectedColor: AppColor.cyan,
                  inactiveColor: const Color(0xffC2C3CB),
                  disabledColor: AppColor.cyan,
                  activeColor: AppColor.cyan,
                
                
                ),
                backgroundColor: AppColor.white,
                
                appContext: context, length: 4, onChanged: (value){}),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                appText(text: '($time)',textAlign: TextAlign.left, textColor: AppColor.lightgrey, fontSize: 14.39, fontweight:  FontWeight.w500),
    
                  ],
                ),
               const SizedBox(
                  height: 14,
                ),
                 appButton(
                  onTap: (){
                    
                verifcationPasswordVM.timer!.cancel();
                
             Get.offAll(PresistentBottomBarItems());
                  }, 
                  widget: appText(
                    text: 'Verify'
                    ,textAlign: TextAlign.center, 
                    fontSize: 16, fontweight: 
                    FontWeight.w600), 
                    width: SizeConfig.widthMultiplier * 100,
                    height: 65.52,
                     buttonColor: AppColor.cyan,
                     radius: 14
                     ),
                     SizedBox(
                      height: SizeConfig.heightMultiplier * 1.13,
                     ),
                     appButton(
                      onTap:       (){
                                           
                  print(verifcationPasswordVM.phoneController.text);
                    // if(_formKey.currentState!.validate()){
                     
                      if(verifcationPasswordVM.time.value == "00:00"){
                     verifcationPasswordVM.timer!.cancel();
                   verifcationPasswordVM.startTimer(240);
                        }
                    
                    // else {
                    //   print('Error');
                    // }
                                        }, 
                  widget: appText(
                    text: 'Send Again',
                    textColor: AppColor.cyan,
                    textAlign: TextAlign.center, 
                    fontSize: 16, fontweight: 
                    FontWeight.w600), 
                    width: SizeConfig.widthMultiplier * 100,
                    height: 65.52,
                     buttonColor: AppColor.lightCyan,
                     radius: 14
                     ),
            ],
          ),
        ),
      ),
    );
  }
}