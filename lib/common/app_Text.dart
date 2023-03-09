import 'package:flutter/material.dart';
import 'package:hotlier/common/app_color.dart';

Widget appText({
required String text,
TextAlign textAlign = TextAlign.left,
Color textColor = AppColor.white,
double fontSize = 20, FontWeight fontweight = FontWeight.w700,
TextOverflow textOverflow = TextOverflow.clip,

}){
  return Text(
    overflow: textOverflow,
    text,textAlign: textAlign, style:  TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontweight,
    fontFamily: 'SF Pro Display'
    ),
  
  );
}