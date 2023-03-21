import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/login/View/login_view.dart';
import 'package:hotlier/AppModules/AuthModule/phone/View/phone_view.dart';
import 'package:hotlier/AppModules/AuthModule/signup/Model/signup_model.dart';
import 'package:hotlier/AppModules/AuthModule/signup/View/component/select_type_tile.dart';
import 'package:hotlier/AppModules/AuthModule/signup/ViewModel/signup_view_model.dart';
import 'package:hotlier/AppModules/BottomNavBarModule/presistent_tab_items.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../../../../common/TextField/text_field.dart';
import '../../../../common/ThirdPartyButtons/third_party_signupTile.dart';

class SignUpView extends StatelessWidget {
 SignUpView({super.key, required this.userType});
final signupVM = Get.put(SignUpViewModel());
String userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteF5,
      body: Form(
        key: signupVM.formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric( horizontal: 35,),
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
                  const SizedBox(
                    height: 30,
                  ),
                  appButton(onTap: (){
                    Get.back();
                  }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, buttonColor: AppColor.white),
                  appText(text: 'Create Your\nAccount', fontSize: 38)
                ],
              ),
            ),
             
            Expanded(
              child: SizedBox(
               
                height: SizeConfig.heightMultiplier * 70,
                child: ListView(
                   padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                  children: [ 
                    // selectUserTile(signupVM: signupVM),
                    // SizedBox(
                    //   height: 20.67,
                    // ),
                   SizedBox(
                height: SizeConfig.heightMultiplier * 2.2,
               ),
               textFormField(context: context, prefixicon: 'assets/profile/Profile.png', validation: (value){
                if(value!.isEmpty){
                  return "Please Enter Your Name";
                }
               }, controller: signupVM.name, hintText: "Enter Name"),
               const SizedBox(
                height: 19.51,
               ),
                   textFormField(context: context, prefixicon: 'assets/profile/Profile.png', validation:(value){
                    if(value!.isEmpty){
                      return 'Please Enter your User Name';
                    }
                   }, controller: signupVM.username, hintText: 'Enter Username'),
                   const SizedBox(
                  height: 19.51
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
                const SizedBox(
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
                      child:signupVM.obsecure.value ? const Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : const Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                    )
                  ),
                ),
                 const SizedBox(
                  height: 19.51
                ),
                  Obx(
                  ()=> textFormField(
                    textInputAction: TextInputAction.next,
                    hintText: 'Confirm Password',
                     validation: (value){
                     if(value!.isEmpty){
                      return "please Enter Your Confirm Password";
                    } else if(signupVM.password.text != signupVM.confirmPassword.text){
                      return 'Your Confirm Password Do not Match';
                    }
                    else {
                      print(' email');
                    }
                  },
                   controller: signupVM.confirmPassword,
                    obsecure: signupVM.obsecure2.value,
                    context: context,
                    prefixicon: 'assets/auth/lock.png',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        print(userType);
                        signupVM.checkConfirmPassword();
                      },
                      child:signupVM.obsecure2.value ? const Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : const Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                    )
                  ),
                ),
                const SizedBox(
                  height: 14.43,
                ),
                
                const SizedBox(
                  height: 24,
                ),
                appButton(onTap: (){
                  if(signupVM.formKey.currentState!.validate()){

                    signupVM.createUser(userType: userType);
                    
                    Get.to( PresistentBottomBarItems(
            
                
                    ));
                    print('success');
                  }
                  else {
                    print('Error');
                  }
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
                   const SizedBox(
                    height: 38.29,
                   ),
                   thirdPartyButtonsTile(
                    onTap: (){
                      signupVM.signUpWithGoogle(context);
                    },
                    onTap1: (){
                      signupVM.signinWithFacebook(context);
                    }
                   ),
                const SizedBox(
                      height: 33.66,
                    ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(text: 'Already Have An Account?', textColor: const Color(0xffACADB9), fontSize: 16, fontweight: FontWeight.w600),
                     GestureDetector(onTap: (){
                      Get.offAll(LoginView());
                     },child: appText(text: 'Sign in', textColor: AppColor.darkgrey,fontSize: 16, fontweight: FontWeight.w600), )
                    ],
                   ), const SizedBox(
                    height: 20,
                   )
                  ],
                  
                ),
              ),
            ),
           
          ],
        ),
      ),
    );;
  }

  
}