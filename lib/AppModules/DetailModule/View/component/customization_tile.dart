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
      style: const TextStyle(
   
   color:  AppColor.lightgrey, fontFamily: 'DS Pro Display'
      ),
      decoration: InputDecoration(
   
   contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22.9),

   hintText: 'Customization Instruction',
   hintStyle: const TextStyle(
     color: AppColor.lightgrey,
   
   ),
  
   filled: true,
   fillColor: AppColor.greyWhite,
   enabled: true,
   focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(radius),
   borderSide: const BorderSide(
     color: AppColor.transparent
   ) 
   ),
  border: OutlineInputBorder(
   borderSide: const BorderSide(
     color: AppColor.transparent
   ),
   borderRadius: BorderRadius.circular(radius)
  ),
  enabledBorder:   OutlineInputBorder(
   borderSide: const BorderSide(
     color: AppColor.transparent
   ),
   borderRadius: BorderRadius.circular(radius)
  ),
  errorBorder: OutlineInputBorder(
   borderSide: const BorderSide(
     color: AppColor.transparent
   ),
   borderRadius: BorderRadius.circular(radius)
  ),
    ),
  );
}