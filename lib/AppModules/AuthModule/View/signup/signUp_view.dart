import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/View/phone/phone_view.dart';
import 'package:hotlier/AppModules/AuthModule/View/signup/component/select_type_tile.dart';
import 'package:hotlier/AppModules/AuthModule/ViewModel/SignupViewModel/signup_view_model.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../../../../common/TextField/text_field.dart';
import 'component/third_party_signupTile.dart';

class SignUpView extends StatelessWidget {
 SignUpView({super.key});
final signupVM = Get.put(SignUpViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteF5,
      body: Form(
        key: signupVM.formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric( horizontal: 35,),
                height: SizeConfig.heightMultiplier * 30,
                width: SizeConfig.widthMultiplier * 100,
                decoration: const BoxDecoration(
              
              borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
              ),              image: DecorationImage(image:AssetImage('assets/auth/login.png'), fit: BoxFit.cover,)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    appButton(onTap: (){
                      Get.back();
                    }, widget: Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, buttonColor: AppColor.white),
                    appText(text: 'Create Your\nAccount', fontSize: 38)
                  ],
                ),
              ),
               SizedBox(
                height: SizeConfig.heightMultiplier * 2.2,
               ),
              Container(
               
                height: SizeConfig.heightMultiplier * 66.8,
                child: ListView(
                   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                  children: [ 
                    selectUserTile(signupVM: signupVM),
                    SizedBox(
                      height: 20.67,
                    ),
                   
                textFormField(
                  hintText: 'Enter Your Email',
                  validation: (value){
                    if(value!.isEmpty){
                      return "please Enter Your Email";
                    } else if(!signupVM.emailRegex.hasMatch(value)){
                      return 'Please Enter Valid Email';
                    }
                    else {
                      print(' email');
                    }
                  },
                  controller: signupVM.email,
                  
                  context: context,
                  prefixicon: 'assets/auth/email.png'
                ),
                SizedBox(
                  height: 19.51
                ),
                Obx(
                  ()=> textFormField(
                    textInputAction: TextInputAction.next,
                    hintText: 'Password',
                     validation: (value){
                     if(value!.isEmpty){
                      return "please Enter Your Password";
                    } else if(!signupVM.passwordRegex.hasMatch(value)){
                      return 'Please Enter Valid Password';
                    }
                    else {
                      print(' email');
                    }
                  },
                   controller: signupVM.password,
                    obsecure: signupVM.obsecure.value,
                    context: context,
                    prefixicon: 'assets/auth/lock.png',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        signupVM.checkPassword();
                      },
                      child:signupVM.obsecure.value ? Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                    )
                  ),
                ),
                 SizedBox(
                  height: 19.51
                ),
                  
                SizedBox(
                  height: 14.43,
                ),
                
                SizedBox(
                  height: 24,
                ),
                appButton(onTap: (){
                  Get.to( PhoneView());
                //   if(signupVM.formKey.currentState!.validate()){
                //     print('success');
                //   }
                //   else {
                //     print('Error');
                //   }
                }, 
                widget: appText(
                  text: 'Register'
                  ,textAlign: TextAlign.center, 
                  fontSize: 16, fontweight: 
                  FontWeight.w600), 
                  width: SizeConfig.widthMultiplier * 100,
                  height: 65.52,
                   buttonColor: AppColor.cyan,
                   radius: 14
                   ),
                   SizedBox(
                    height: 38.29,
                   ),
                   thirdPartySignUpTile(),
                const SizedBox(
                      height: 33.66,
                    ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(text: 'Already Have An Account?', textColor: Color(0xffACADB9), fontSize: 16, fontweight: FontWeight.w600),
                     GestureDetector(onTap: (){
                      Get.back();
                     },child: appText(text: 'Sign in', textColor: AppColor.darkgrey,fontSize: 16, fontweight: FontWeight.w400), )
                    ],
                   ), SizedBox(
                    height: 20,
                   )
                  ],
                  
                ),
              ),
             
            ],
          ),
        ),
      ),
    );;
  }

  
}