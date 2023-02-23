

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/DetailModule/View/detail_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';

import '../../../../../common/size_config.dart';
import '../../../Model/explore_model.dart';

Widget explore2GridTile(
  {
    required String imageUrl,
    required String title,
    required String price,
    VoidCallback? addFavorite,
    required bool check
  }
){
  return   GestureDetector(
      onTap: (){
         FocusManager.instance.primaryFocus!.unfocus();
        Get.to(DetailView());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.buttonColor
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              alignment: Alignment.topRight,
              height: SizeConfig.heightMultiplier * 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                
                ),
                image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)
              ),
              child: appButton(onTap: addFavorite, widget:ImageIcon(AssetImage('assets/navbar/Heart.png'), size: 13, color: check == false? AppColor.black : Color(0xffFF5555) ,), height: 27,width: 27, buttonColor: AppColor.white),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                color: AppColor.buttonColor,
              ),
              height: SizeConfig.heightMultiplier * 8,
           
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText(text: title, textColor: AppColor.textBlack, fontSize: 16, fontweight: FontWeight.w500,),
                  appText(text: price, textColor: AppColor.textBlack, fontSize: 12, fontweight: FontWeight.w400,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  
}