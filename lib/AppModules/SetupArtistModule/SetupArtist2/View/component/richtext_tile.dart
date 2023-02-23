import 'package:flutter/material.dart';
import 'package:hotlier/common/app_color.dart';

Widget richTextTile({
  required String label,
  required String title,
  Color labelColor = AppColor.labelColor,
  double fontSize = 15,
  FontWeight labelFontWeight = FontWeight.w500,
  FontWeight titleFontWeight = FontWeight.w400,
  Color titleColor = AppColor.color7A
 
}){
  return RichText(
    
    text: TextSpan(
       style: TextStyle(
        color: labelColor,
        fontSize: fontSize,
        fontWeight: labelFontWeight
       ),
      text: label,
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: titleColor,
            fontSize: fontSize,
            fontWeight: titleFontWeight
          )
        )
      ]
    ));
}