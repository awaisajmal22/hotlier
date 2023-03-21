import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/ForgetPassword/View/Component/dailog_box.dart';
import 'package:hotlier/AppModules/AuthModule/phone/View/component/phone_text_formfield.dart';
import 'package:hotlier/AppModules/AuthModule/ForgetPassword/ViewModel/forget_password_view_model.dart';
import 'package:hotlier/common/TextField/text_field.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../../phone/View/component/dailog_box.dart';
import 'package:country_picker/country_picker.dart';

class EmailandPhoneView extends StatelessWidget {
  EmailandPhoneView({super.key, required this.index});
  int index;
  final forgetPasswordVM = Get.put(ForgetPasswordViewModel());
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Form(
            key: forgetPasswordVM.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 appButton(
                              onTap: (){
                               Navigator.of(context).pop();
                              }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                              buttonColor: AppColor.white),
                              SizedBox(
                                height: SizeConfig.heightMultiplier* 9.5,
                              ),
                
                              appText(text: index == 0 ? 'Enter Your Email' : 'Enter Your Phone Number', textColor: AppColor.textBlack,textAlign: TextAlign.start, fontSize: 38, fontweight: FontWeight.w700),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 5.9,
                              ),
                             index == 0 ? textFormField(
                              context: context,
                              prefixicon: 'assets/auth/email.png', 
                             validation: (value){
                    if(value!.isEmpty){
                      return "please Enter Your Email";
                    } else if(!forgetPasswordVM.emailRegex.hasMatch(value)){
                      return 'Please Enter Valid Email';
                    }
                    else {
                      print(' email');
                    }
                  },
                              controller: forgetPasswordVM.forgetPasswordEmailController, 
                             hintText: 'Email') : Obx(
                              ()=> phoneTextFormField(
                                validateCheck: forgetPasswordVM.phoneCheck.value,
              validator: (value){
        if(value!.isEmpty){
          forgetPasswordVM.phoneCheck.value = true;
          return "Please Enter Your Phone Number";
        }
        else {
          forgetPasswordVM.phoneCheck.value = false;
        }
        return null;
      },
                                onChanged: (value){
                                  forgetPasswordVM.countryCode.value = value!.dialCode.toString();
                                },
                                keyboardType: TextInputType.phone,
                              countryCode: forgetPasswordVM.countryCode.value,
                                context: context, 
                               controller: phoneController, 
                               hintText: 'Enter Phone Number', ),
                             ),
                             
                             SizedBox(
                // height: 24.29,
                height: SizeConfig.heightMultiplier * 3.16,
          
              ),
                              appButton(
                onTap: (){
               if(forgetPasswordVM.formKey.currentState!.validate()){
              forgetPasswordVM.startTimer(240);
                               showGeneralDialog(
                                barrierColor: AppColor.white.withOpacity(0.02),
                                context: context,
                                pageBuilder: (context, animation, secondaryAnimation) {
                                 return BackdropFilter(
                                       filter: ImageFilter.blur(
                                            sigmaX: 1.8,sigmaY: 1.8
                                          ),
                                      child: index == 0 ? ForgetPasswordDailog(
                                        time: forgetPasswordVM.time.value,
                                        title: forgetPasswordVM.forgetList[0].title,
                                        subtitle: forgetPasswordVM.forgetPasswordEmailController.text,
                                      ) : Obx(
                                        ()=> ForgetPasswordDailog(
                                          time: forgetPasswordVM.time.value,
                                          title: forgetPasswordVM.forgetList[1].title,
                                          subtitle:'${forgetPasswordVM.countryCode.value}${phoneController.text}',
                                        ),
                                      ),
                                    
                                 );
                               },);
                               }
                               else {
                                print('error');
                               }
            }, 
            widget: appText(
              text: 'Verification'
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
                onTap: (){
                  print(phoneController.text);
                  // print(forgetPasswordVM.countryCode.value);
              // if(_formKey.currentState!.validate()){
              //   print('success');
              // }
              // else {
              //   print('Error');
              // }
            }, 
            widget: appText(
              text: 'Later',
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
      ),
    );
  }
}