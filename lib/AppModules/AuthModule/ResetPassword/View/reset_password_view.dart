import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/ResetPassword/ViewModel/reset_password_view_model.dart';
import 'package:hotlier/common/TextField/text_field.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';

class ResetPasswordView extends StatelessWidget {
   ResetPasswordView({super.key});
  final resetPasswordVM = Get.put(ResetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Form(
          key: resetPasswordVM.formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appButton(
                          onTap: (){
                           Navigator.of(context).pop();
                          }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                          buttonColor: AppColor.white),
                ],
               ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier* 9.5,
                          ),
        
                          appText(text: 'Reset Your Password', textColor: AppColor.textBlack, fontSize: 38, fontweight: FontWeight.w700),
                          SizedBox(
                            height:45.19,
                          ),
                          Obx(
                    ()=> textFormField(
                      textInputAction: TextInputAction.done,
                      hintText: 'Password',
                       validation: (value){
                       if(value!.isEmpty){
                        return "please Enter Your Password";
                      } else if(resetPasswordVM.passwordRegex.hasMatch(value)){
                        return 'Please Enter Valid Password';
                      }
                      else {
                        print(' email');
                      }
                    },
                      controller: resetPasswordVM.passwordController,
                      obsecure: resetPasswordVM.check1.value,
                      context: context,
                      prefixicon: 'assets/auth/lock.png',
                      suffixIcon: GestureDetector(
                        onTap: (){
                          resetPasswordVM.check1.value = !resetPasswordVM.check1.value;
                        },
                        child:resetPasswordVM.check1.value ? Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                      )
                    ),
                  ),
                  SizedBox(
                    height: 20.48,
                  ),
                   Obx(
                    ()=> textFormField(
                      textInputAction: TextInputAction.done,
                      hintText: 'Password',
                       validation: (value){
                       if(value!.isEmpty){
                        return "please Enter Your Password";
                      } else if(resetPasswordVM.passwordRegex.hasMatch(value) || resetPasswordVM.confirmPasswordController.text != resetPasswordVM.passwordController.text){
                        return 'Please Enter Valid Password';
                      }
                      else {
                        print(' email');
                      }
                    },
                      controller: resetPasswordVM.confirmPasswordController,
                      obsecure: resetPasswordVM.check2.value,
                      context: context,
                      prefixicon: 'assets/auth/lock.png',
                      suffixIcon: GestureDetector(
                        onTap: (){
                          resetPasswordVM.check2.value = !resetPasswordVM.check2.value;
                        },
                        child:resetPasswordVM.check2.value ? Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                      )
                    ),
                  ),
                  SizedBox(
                    height: 32.48,
                  ),
                   appButton(onTap: (){
                    if(resetPasswordVM.formKey.currentState!.validate() && resetPasswordVM.passwordController.text == resetPasswordVM.confirmPasswordController.text){
                      print('success');
                    }
                    else {
                      print('Error');
                    }
                  }, 
                  widget: appText(
                    text: 'Login'
                    ,textAlign: TextAlign.center, 
                    fontSize: 16, fontweight: 
                    FontWeight.w600), 
                    width: SizeConfig.widthMultiplier * 100,
                    height: 65.52,
                     buttonColor: AppColor.cyan,
                     radius: 14
                     ),
            ],
          ),
        )
        ),
    );
  }
}