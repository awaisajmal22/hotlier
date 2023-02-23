import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/View/ForgetPassword/forget_password_view.dart';
import 'package:hotlier/AppModules/AuthModule/View/signup/signUp_view.dart';
import 'package:hotlier/AppModules/AuthModule/ViewModel/LoginViewModel/login_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';
import 'package:hotlier/common/TextField/text_field.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
final loginController = Get.put(LoginViewModel());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form(
          key: loginController.formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                height: SizeConfig.heightMultiplier * 30,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(
              
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
                    appText(text: 'Login Your\nAccount', fontSize: 38)
                  ],
                ),
              ),
         
              SizedBox(
          height: SizeConfig.heightMultiplier * 3.5,
              ),
              Container(
                height: SizeConfig.heightMultiplier * 70,
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: ListView(
                  padding: EdgeInsets.all(0),
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
                SizedBox(
                  height: 19.51
                ),
                Obx(
                  ()=> textFormField(
                    textInputAction: TextInputAction.done,
                    hintText: 'Password',
                     validation: (value){
                     if(value!.isEmpty){
                      return "please Enter Your Password";
                    } else if(!loginController.passwordRegex.hasMatch(value)){
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
                      child:loginController.obsecure.value ? Icon(Icons.visibility_off_outlined, color: AppColor.lightgrey,) : Icon(Icons.visibility_outlined, color: AppColor.lightgrey,),
                    )
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: 24,
                ),
                appButton(onTap: (){
                  if(loginController.formKey.currentState!.validate()){
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
                   SizedBox(
                    height: 38.29,
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(text: 'Create New Account?', textColor: Color(0xffACADB9), fontSize: 16, fontweight: FontWeight.w600),
                      GestureDetector(onTap: (){
                        Get.to(SignUpView());
                      }, child: appText(text: 'Sign up', textColor: AppColor.darkgrey,fontSize: 16, fontweight: FontWeight.w400),)
                    ],
                   )
                  ],
                  
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}