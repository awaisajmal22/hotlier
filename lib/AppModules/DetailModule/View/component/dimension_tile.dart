import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/DetailModule/ViewModel/detail_view_model.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/dimension_dailogBox.dart';
import 'package:hotlier/AppModules/DetailModule/View/detail_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

Widget dimentionTile({
  required BuildContext context,
  required DetailViewModel detailVM
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(text: 'Dimension', fontSize: 14, fontweight: FontWeight.w400, textColor: AppColor.textBlack),
      SizedBox(
        height: 5,
      ),
      GestureDetector(
        onTap: (){
          Get.bottomSheet(
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
              height: SizeConfig.heightMultiplier * 38,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  appText(text: 'Dimension', fontSize: 14, fontweight: FontWeight.w400, textColor: AppColor.textBlack),
                  Container(
                    height: SizeConfig.heightMultiplier * 11.4,
                    child: GridView.builder(
                      itemCount: detailVM.dimensionList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 12/3
                    ), itemBuilder: ((context, index) {
                      return GestureDetector(
              onTap: (){
                detailVM.selectedDimensionIndex.value = index;
                detailVM.selectedDimension.value = detailVM.dimensionList[index];
                
              },
              child: Obx(
                ()=> Container(
                padding: EdgeInsets.symmetric( vertical: 13, horizontal:  10),
                    
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1, color: detailVM.selectedDimensionIndex.value == index ? AppColor.textBlack : AppColor.transparent
                ),
                color: AppColor.greyWhite
                ),
                child: FittedBox(child: appText(text: detailVM.dimensionList[index], textColor: Color(0xff5D5D5D), fontSize: 14, fontweight: FontWeight.w400)),
                      ),
              ),
                      );
                    })),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  appButton(
                    buttonColor: AppColor.greyWhite,
                    onTap: (){
                      dimensionDailogBox(context, detailVM: detailVM);
                      
                    },
                     widget: FittedBox(
                    child: appText(
                      text: 'Customize Dimensions', 
                      textColor: AppColor.textBlack, fontSize: 15,
                       fontweight: FontWeight.w400)), height: 46, 
                       width: SizeConfig.widthMultiplier * 100,
              widgetAlignment: Alignment.center,
              radius: 4
              ),
              SizedBox(
                height: 32,
              ),
              appButton(
                    buttonColor: AppColor.cyan,
                    onTap: (){
                      detailVM.dimension.value = detailVM.selectedDimension.value;
                      Get.back();
                  }, widget: FittedBox(
                    child: appText(
                      text: 'Add Dimension', 
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
        },
        child: Container(
          height: 46,
          width: SizeConfig.widthMultiplier * 43,
          padding: EdgeInsets.symmetric( vertical: 13, horizontal:  10),
      
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
          color: AppColor.greyWhite
          ),
          child: Obx(()=> FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(text: detailVM.dimension.value, textColor: Color(0xff5D5D5D), fontSize: 14, fontweight: FontWeight.w400),
                      Icon(Icons.keyboard_arrow_down,  color: AppColor.gery5D)
          
              ],
            ),
          )),
        ),
      )

    ],
  );
}
