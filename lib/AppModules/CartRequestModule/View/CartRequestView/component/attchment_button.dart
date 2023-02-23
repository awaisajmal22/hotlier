import 'package:flutter/cupertino.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

Widget attechmentButton({
  double height = 46,
  double width = 164,
  Color buttonColor = AppColor.labelColor,
  VoidCallback? onTap, 
  required String icon,
  required String text
  }
){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 13,bottom: 13, left: 21),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage(icon),),
          SizedBox(
            width: 8,
          ),
          appText(text: text, textColor: AppColor.white, fontSize: 14, fontweight: FontWeight.w400)
        ],
      ),
    ),
  );
}