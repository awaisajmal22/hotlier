import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/View/YourRequest/your_request_cart_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/ViewModel/select_or_create_project_view_model.dart';

import '../../../../../../common/app_Text.dart';
import '../../../../../../common/app_button.dart';
import '../../../../../../common/app_color.dart';
import '../../../../../../common/size_config.dart';
import '../../../../../CartRequestModule/View/CartRequestView/component/formField.dart';
import '../../../../../CartRequestModule/ViewModel/cart_request_view_model.dart';

void createProjectTile({
  required TextEditingController controller,
  VoidCallback ? onTap
  }
){
Get.bottomSheet(
  isDismissible: false,
            barrierColor: AppColor.white.withOpacity(0.1),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.8,sigmaY: 1.8
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 23,vertical: 20),
              decoration: BoxDecoration(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                       const  SizedBox(
                          height: 10,
                        ),
                  appText(text: 'Create Project', fontSize: 20, fontweight: FontWeight.w600, textColor: Color(0xff292929), ),

                      ],
                    ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: ImageIcon(AssetImage('assets/profile/close.png')))

                  ],
                ),
                 SizedBox(
                  height: 11,
                 ),
                 formField(controller: controller, maxLine: 1, title: 'Project name'),
                 SizedBox(
                  height: 11,
                 ),
                  appButton(
                    buttonColor: AppColor.cyan,
                    onTap: onTap, widget: FittedBox(
                    child: appText(
                      text: 'Create Project', 
                      textColor: Color(0xffF3F5F6), fontSize: 16,
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