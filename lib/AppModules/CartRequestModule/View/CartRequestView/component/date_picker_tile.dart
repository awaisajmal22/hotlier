import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:intl/intl.dart';

Widget datePickerTile({
  required VoidCallback? onTap,
  required String date
  }
){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      color: AppColor.buttonColor,
        
      ),
      padding: EdgeInsets.symmetric(horizontal: 19,vertical: 15),
      height: 54,
      child: Row(
        children: [
         Image(image: AssetImage('assets/cart/date.png'), height: 20,
         width: 20, color: AppColor.cyan,),
         SizedBox(
          width: 39,
         ),
         appText(text: date, textColor: AppColor.cyan, fontSize: 14, fontweight: FontWeight.w500)
        ],
      ),
    ),
  );
}