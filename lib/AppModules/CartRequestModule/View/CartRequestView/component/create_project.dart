

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/formField.dart';
import 'package:hotlier/AppModules/CartRequestModule/ViewModel/cart_request_view_model.dart';
import 'package:hotlier/AppModules/UserProfileModule/CreateOrSelectProject/ViewModel/select_or_create_project_view_model.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_button.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

void createProject({
  required TextEditingController controller,
  required  RequestProjectViewModel cartrequestVM
  }
){
Get.bottomSheet(
            barrierColor: AppColor.white.withOpacity(0.1),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.8,sigmaY: 1.8
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  
                ),
                color: AppColor.white
              ),
              height: SizeConfig.heightMultiplier * 30,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  appText(text: 'Create Project', fontSize: 20, fontweight: FontWeight.w600, textColor: const Color(0xff292929), ),
                 const SizedBox(
                  height: 11,
                 ),
                 formField(controller: controller, maxLine: 1, title: 'Project name'),
                 const SizedBox(
                  height: 11,
                 ),
                  appButton(
                    buttonColor: AppColor.cyan,
                    onTap: (){
                      // cartrequestVM.projectNameList.add(cartrequestVM.addProjectController.text);
                      cartrequestVM.projectName.value = cartrequestVM.addProjectController.text;
                      Get.back();
                  }, widget: FittedBox(
                    child: appText(
                      text: 'Create Project', 
                      textColor: const Color(0xffF3F5F6), fontSize: 16,
                       fontweight: FontWeight.w400)), height: 66, 
                       width: SizeConfig.widthMultiplier * 100,
              widgetAlignment: Alignment.center,
              radius: 14
              ),
                
              ],
              ),
                      ),
            )
          );
}