import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/Model/profile_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

takePictureBottomSheet(
  {
    required List<ProfileModel> data,
   VoidCallback? fromCamera,
   VoidCallback? fromGallery,
   VoidCallback? delete
  }
){
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      height: SizeConfig.heightMultiplier * 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        color: AppColor.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(text: 'Select Profile photo', textColor: Color(0xff292929),fontSize: 20, fontweight: FontWeight.w700),
          SizedBox(
            height: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(data.length, (index) =>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){
                    if(index == 0){
                      fromCamera!();
                    }
                    else if(index == 1){
                      fromGallery!();
                    }else if(index == 2){
                      delete!();
                    }
                  },
                  leading: ImageIcon( AssetImage(data[index].leadingIcon), 
                  color: AppColor.black,),
                  title: appText(text: data[index].title, textColor: Color(0xff292929), fontSize: 16, fontweight: FontWeight.w400),
                  ),
                index == data.length - 1 ? SizedBox() : Container(
                    height: 1,
                    width: SizeConfig.widthMultiplier * 50,
                    color: Colors.grey[100],
                  )
              ],
            )
              ),
          )
        ],
      ),
    )
  );
}