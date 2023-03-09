import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/signup/View/signUp_view.dart';
import 'package:hotlier/AppModules/AuthModule/signup/ViewModel/signup_view_model.dart';

import '../../../common/app_Text.dart';
import '../../../common/app_button.dart';
import '../../../common/app_color.dart';
import '../../../common/size_config.dart';

class SelectUserTypeView extends StatelessWidget {
   SelectUserTypeView({super.key});
final selectUserTpeVM = Get.put(SignUpViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
                  appText(text: 'Select Your Singup Mode', fontSize: 38)
                ],
              ),
            ),
            SizedBox(
              height: 20.9,
            ),
        Column(
          children: List.generate(selectUserTpeVM.selectTypeList.length, (index) => GestureDetector(
            onTap: (){
              selectUserTpeVM.selectedIndex.value = index;
              print(selectUserTpeVM.selectTypeList[selectUserTpeVM.selectedIndex.value]);
            },
            child: Obx(
              ()=> Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 25),
                margin: EdgeInsets.symmetric(horizontal: 35, vertical: 9),
                  height: 65.52,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 22,
                        spreadRadius: -1,
                        offset: Offset(0, 4),
                        color: Color(0xff2E404D).withOpacity(0.15)
                      )
                    ],
                    color:  AppColor.white,
                    border: Border.all(
                      color: selectUserTpeVM.selectedIndex.value == index ? AppColor.cyan : AppColor.transparent,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(12.85)
                  ),
                  child: appText(text: selectUserTpeVM.selectTypeList[index], textColor: selectUserTpeVM.selectedIndex == index ? AppColor.cyan : Color(0xffC2C3CB), fontSize: 14),
                ),
            ),
          )),
        ),
            SizedBox(
        height: SizeConfig.heightMultiplier * 3.5,
            ),
            Container(
              height: SizeConfig.heightMultiplier * 70,
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
              
              const SizedBox(
                height: 14.43,
              ),
              
              const SizedBox(
                height: 24,
              ),
              appButton(onTap: () async {
                Get.to(SignUpView( userType: selectUserTpeVM.selectTypeList[selectUserTpeVM.selectedIndex.value],));
              }, 
              widget: appText(
                text: 'Next'
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
            ),
           
          ],
        ),
      ),
    );
  }
}