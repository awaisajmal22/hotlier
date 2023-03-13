import 'package:flutter/material.dart';
import 'package:hotlier/common/app_color.dart';

Widget textFormField(
  {
    required BuildContext context,
   
    double radius =12.84,
    bool obsecure = false,
    required String? prefixicon,
    GestureDetector ? suffixIcon, 
    required Function(String?)? validation,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    required String hintText,
    int maxLines = 1
  }
){
  return Container(
    decoration: BoxDecoration(
      
      boxShadow: [
      BoxShadow(
        color: AppColor.shadowColor.withOpacity(0.15),
        spreadRadius: -1,
        blurRadius: 22,
        offset: const Offset(0, 4), // changes position of shadow
      ),
      ],
      borderRadius: BorderRadius.circular(radius)
    ),
    child: TextFormField(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      validator: validation as String? Function(String?),
      autofocus: false,
      obscureText: obsecure,
      cursorColor: AppColor.cyan,
      style: const TextStyle(
        fontFamily: 'DS Pro Display',
        color:  AppColor.lightgrey
      ),
      decoration: InputDecoration(
        
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22.9),

        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.lightgrey,
        
        ),
        suffixIcon: suffixIcon,
      focusColor: AppColor.cyan,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 22.9),
          child: ImageIcon(AssetImage(prefixicon!), ),
        ),
        filled: true,
        fillColor: AppColor.white,
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: AppColor.cyan
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
  )
  );
}