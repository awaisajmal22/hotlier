import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/ForgetPassword/View/forget_password_view.dart';
import 'package:hotlier/AppModules/AuthModule/signup/View/signUp_view.dart';
import 'package:hotlier/AppModules/AuthModule/login/ViewModel/login_view_model.dart';
import 'package:hotlier/AppModules/SelectUserTypeModule/View/select_user_type_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/EditProfile/ViewModel/edit_profile_view_model.dart';
import 'package:hotlier/common/ThirdPartyButtons/third_party_signupTile.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/loadingIndicator.dart';
import 'package:hotlier/common/size_config.dart';
import 'package:hotlier/common/TextField/text_field.dart';

import '../../../BottomNavBarModule/presistent_tab_items.dart';
import '../services/login_services.dart';
import '../../signup/Services/signup_services.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
final loginController = Get.put(LoginViewModel());
final profileVM = Get.put(EditProfileViewModel());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: loginController.formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 18),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 
                  // appButton(onTap: (){
                  //   Get.back();
                  // }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, buttonColor: AppColor.white),
                  appText(text: 'Login Your\nAccount', fontSize: 38)
                ],
              ),
            ),
       
            
            Expanded(
              child: Container(
                height: SizeConfig.heightMultiplier * 70,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: ListView(
                  children: [
                textFormField(
                  hintText: 'Enter Your Email',
                  validation: (value){
                    if(value!.isEmpty){
                      return "please Enter Your Email";
                    } else if(!loginController.emailRegex.hasMatch(value)){
                      return 'Please Enter Valid Email';
                    }
                    else {
                      print(' email');
                    }
                  },
                  controller: loginController.email,
                  
                  context: context,
                  prefixicon: 'assets/auth/email.png'
                ),
                const SizedBox(
                  height: 19.51
                ),
                Obx(
                  ()=> textFormField(
                    textInputAction: TextInputAction.done,
                    hintText: 'Password',
                     validation: (value){
                     if(value!.isEmpty){
                      return "please Enter Your Password";
                    } else if(loginController.password.value.text.length < 4){
                      return 'Please Enter Valid Password';
                    }
                    else {
                      print(' email');
                    }
                  },
                    controller: loginController.password,
                    obsecure: loginController.obsecure.value,
                    context: context,
                    prefixicon: 'assets/auth/lock.png',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        loginController.checkPassword();
                      },
                      child:loginController.obsecure.value ? const Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : const Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                    )
                  ),
                ),
                const SizedBox(
                  height: 14.43,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  GestureDetector(onTap: (){
                    Get.to(ForgetView());
                  }, 
                  child: appText(
                text: 'Forget Password ?', 
                textColor: AppColor.darkgrey,
                 fontSize: 12,
                 textAlign: TextAlign.end, 
                 fontweight: FontWeight.w500),),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                appButton(onTap: () async {
                 Get.offAll(PresistentBottomBarItems());
                  // if(loginController.formKey.currentState!.validate()){
                  //   showLoadingIndicator(context: context);
                  //   bool? data = await loginController.onLogin();
                  //   hideOpenDialog(context: context);
                  //   print(data);
                  //   if(data == true){
                  //  profileVM.getUserDetail();
                   
                  //   print('success');
                  //   }
            
                   
                   
                  // }
                  // else {
                  //   print('Error');
                  // }
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
                   const SizedBox(
                    height: 38.29,
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(text: 'Create New Account?', textColor: const Color(0xffACADB9), fontSize: 16, fontweight: FontWeight.w600),
                      GestureDetector(onTap: (){
                    
                        Get.to(SelectUserTypeView());
                      }, child: appText(text: 'Sign up', textColor: AppColor.darkgrey,fontSize: 16, fontweight: FontWeight.w600),)
                    ],
                   ),
                   const SizedBox(
                    height: 45,
                   ),
                   thirdPartyButtonsTile()
                  ],
                  
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}