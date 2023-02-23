import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';

Widget customizationTile(
  {
    double radius = 10
  }
){
  return TextFormField(
   maxLines: 5,
   keyboardType: TextInputType.text,
      autofocus: false,
      cursorColor: AppColor.cyan,
      style: TextStyle(
   
   color:  AppColor.lightgrey
      ),
      decoration: InputDecoration(
   
   contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 22.9),

   hintText: 'Customization Instruction',
   hintStyle: TextStyle(
     color: AppColor.lightgrey,
   
   ),
  
   filled: true,
   fillColor: AppColor.greyWhite,
   enabled: true,
   focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(radius),
   borderSide: BorderSide(
     color: AppColor.transparent
   ) 
   ),
  border: OutlineInputBorder(
   borderSide: BorderSide(
     color: AppColor.transparent
   ),
   borderRadius: BorderRadius.circular(radius)
  ),
  enabledBorder:   OutlineInputBorder(
   borderSide: BorderSide(
     color: AppColor.transparent
   ),
   borderRadius: BorderRadius.circular(radius)
  ),
  errorBorder: OutlineInputBorder(
   borderSide: BorderSide(
     color: AppColor.transparent
   ),
   borderRadius: BorderRadius.circular(radius)
  ),
    ),
  );
}