import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

Widget appButton({
  required VoidCallback? onTap,
  Color buttonColor = Colors.transparent,
  double radius = 10,
  double height = 24,
  double width  = 49.89,
  double inkWellRadius = 5,
  required Widget widget,
  Alignment widgetAlignment = Alignment.center
  
}){
  return InkWell(
    onTap: onTap,
    radius: radius,
    customBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inkWellRadius)
    ),
    highlightColor: AppColor.white.withOpacity(0.67),
    child: Container(
      alignment: widgetAlignment,
      height: height,
      width: width,
      decoration: BoxDecoration(
       boxShadow: [
        BoxShadow(
          color:  const Color(0xffD3D1D8).withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 23.68,
          offset: Offset(0, 4)

)
        
       ],
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: widget,
    ),
  );
}