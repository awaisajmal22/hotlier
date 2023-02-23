import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/View/ForgetPassword/Component/dailog_box.dart';
import 'package:hotlier/AppModules/AuthModule/ViewModel/ForgetPasswordViewModel/forget_password_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import 'Component/forget_password_tile.dart';

class ForgetView extends StatelessWidget {
   ForgetView({super.key});
   final forgetPasswordVM = Get.put(ForgetPasswordViewModel());
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
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

                        appText(text: 'Forget Password', textColor: AppColor.textBlack, fontSize: 38, fontweight: FontWeight.w700),
                        appText(text: 'Select which contact details should we use to reset your password', textColor: Color(0xffACADB9), fontSize: 14, fontweight: FontWeight.w400),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 5.3,
                        ),
                        Column(
                          children: List.generate( 
                            forgetPasswordVM.forgetList.length, (index)=> Obx(
                              ()=> forgetPasswordTile(
                                imageUrl: forgetPasswordVM.forgetList[index].imageUrl, 
                                title: forgetPasswordVM.forgetList[index].title,
                                onTap: (){
                                  forgetPasswordVM.selectedIndex.value = index;
                                },
                                selectedIndex: forgetPasswordVM.selectedIndex.value,
                                index: index
                                ),
                            ),),
                            
                          
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 5.5,
                        ),
                         appButton(
                            onTap: (){
                              forgetPasswordVM.startTimer(240);
                             showGeneralDialog(
                              barrierColor: AppColor.white.withOpacity(0.02),
                              context: context,
                              pageBuilder: (context, animation, secondaryAnimation) {
                               return Obx(
                                ()=> BackdropFilter(
                                     filter: ImageFilter.blur(
                                          sigmaX: 1.8,sigmaY: 1.8
                                        ),
                                    child: forgetPasswordVM.selectedIndex.value == 0 ? customDailog(
                                      time: forgetPasswordVM.time.value,
                                      title: forgetPasswordVM.forgetList[0].title,
                                      subtitle: 'awis@--gmail.com',
                                    ) : customDailog(
                                      time: forgetPasswordVM.time.value,
                                      title: forgetPasswordVM.forgetList[1].title,
                                      subtitle: '+923400000',
                                    ),
                                  ),
                               );
                             },);
                            }, 
                            widget: appText(text: 'Next',fontSize: 16, fontweight: FontWeight.w600), height: SizeConfig.heightMultiplier * 8.3, width: SizeConfig.widthMultiplier * 100, buttonColor: AppColor.cyan),
                        
          ],
      ),
        )),
    );
  }

  
}