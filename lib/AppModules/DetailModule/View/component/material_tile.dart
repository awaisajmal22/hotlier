import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotlier/AppModules/DetailModule/ViewModel/detail_view_model.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';

Widget materialTile({
  required DetailViewModel detailVM
}){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(text: 'Material', fontSize: 14, fontweight: FontWeight.w400, textColor: AppColor.textBlack),
      SizedBox(
        height: 5,
      ),
//       
      Container(
        
        width: SizeConfig.widthMultiplier * 43,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
        ),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField(
          
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down, color: AppColor.gery5D,size: 14,),
            hint: FittedBox(child: appText(text: detailVM.material.value, textColor: AppColor.gery5D,fontSize: 14, fontweight: FontWeight.w400)),
            decoration: InputDecoration(
            
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: AppColor.greyWhite
            ),
        
            borderRadius: BorderRadius.circular(4),
            items: detailVM.materialList.map((e){
            return DropdownMenuItem(
              
              value: e,
              child: appText(text: e, textColor: AppColor.gery5D,fontSize: 18, fontweight: FontWeight.w400),);
          }).toList(), onChanged: (value){
        detailVM.material.value = value.toString();
          }),
        )
      )

    ],
  );
}