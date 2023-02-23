import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotlier/common/app_color.dart';

Widget phoneTextFormField(
  {
    required BuildContext context,
   
    double radius =12.84,
    bool obsecure = false,
    required CountryCodePicker? prefixicon,
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
        offset: Offset(0, 4), // changes position of shadow
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
      style: TextStyle(
        
        color:  AppColor.lightgrey
      ),
      decoration: InputDecoration(
        
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 22.9),

        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.lightgrey,
        
        ),
        suffixIcon: suffixIcon,
      focusColor: AppColor.cyan,
        prefixIcon: prefixicon,
        filled: true,
        fillColor: AppColor.white,
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: AppColor.cyan
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
  )
  );
}