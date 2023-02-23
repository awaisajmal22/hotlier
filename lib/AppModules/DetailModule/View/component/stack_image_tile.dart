import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/DetailModule/ViewModel/detail_view_model.dart';
import 'package:hotlier/AppModules/DetailModule/View/detail_view.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';

Widget detailStackImageTile({required DetailViewModel detailVM}){
  return SizedBox(
        height: SizeConfig.heightMultiplier * 45,
        width: SizeConfig.widthMultiplier * 100,
       child: Stack(
            
         alignment: AlignmentDirectional.center,
         children: [
           
        Obx(
          ()=> Container(
           margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 3.5),
           height: SizeConfig.heightMultiplier * 45 ,
           width: SizeConfig.widthMultiplier * 100,
           decoration: BoxDecoration(
             image: DecorationImage(image: NetworkImage(detailVM.images[detailVM.selectImage.value]),fit: BoxFit.cover)
           ),
           child: Stack(
             alignment: Alignment.center,
             children: [
         Positioned(
               right:  22,
               child: Column(
                 children: List.generate(3, (index) => GestureDetector(
                   onTap: (){
                     detailVM.selectImage.value = index;
                   },
                   child: Obx(
                     ()=> Container(
                       margin: EdgeInsets.symmetric(
                         vertical: 8
                       ),
                       height: 61,
                       width: 61,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: NetworkImage(detailVM.images[index]), fit: BoxFit.cover),
                         borderRadius: BorderRadius.circular(10),
                         border: Border.all(
                           width: 1,
                           color: detailVM.selectImage == index ? AppColor.white : Colors.transparent
                         )
                       ),
                     ),
                   ),
                 )),
               ),
             ),
             
             ],
           ),
          ),
        ),
          
           Positioned(
             bottom: 0,
             child: Row(
             
             children: [
                GestureDetector(
             onTap: (){
               detailVM.selectedImageButton.value = 0;
             }, child: Obx(
               ()=> Container(
                         
                 alignment: Alignment.center,
                 margin: EdgeInsets.symmetric(horizontal: 5),
                 decoration: BoxDecoration(
                   boxShadow: [
                     BoxShadow(
                       blurRadius: 20,
                       spreadRadius: 6,
                       offset: Offset(0, 4),
                       color: AppColor.black.withOpacity(0.06)
                     )
                   ],
               color: detailVM.selectedImageButton.value == 0 ? AppColor.cyan : AppColor.white,
               borderRadius: BorderRadius.circular(10)
                 ),
               width: SizeConfig.widthMultiplier * 43 
               ,height: SizeConfig.heightMultiplier * 8,
               child: appText(text: 'Ready Stock', textColor: detailVM.selectedImageButton.value == 0 ? AppColor.white : AppColor.lightgrey, fontSize: 14, fontweight: FontWeight.w400 ),
               ),
             ),),
             GestureDetector(
             onTap: (){
               detailVM.selectedImageButton.value = 1;
             }, child: Obx(
               ()=> Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.symmetric(horizontal: 5),
                 decoration: BoxDecoration(
                   boxShadow: [
                     BoxShadow(
                       blurRadius: 20,
                       spreadRadius: 6,
                       offset: Offset(0, 4),
                       color: AppColor.black.withOpacity(0.06)
                     )
                   ],
               color: detailVM.selectedImageButton.value == 1 ? AppColor.cyan : AppColor.white,
               borderRadius: BorderRadius.circular(10)
                 ),
               width: SizeConfig.widthMultiplier * 43,height: SizeConfig.heightMultiplier * 8 ,
               child:   appText(text: 'Produced on demand', textColor: detailVM.selectedImageButton.value == 1 ? AppColor.white :AppColor.lightgrey, fontSize: 14, fontweight: FontWeight.w400 ),
               ),
             ),)
         ]),
                       ),
           
          
         ],
       ),
     );
}