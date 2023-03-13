import 'package:flutter/material.dart';

import '../../../../../common/app_color.dart';

Widget editProfileFormField(
  {
    required TextEditingController controller,
    double radius = 10,
    int? maxLine = 1,
    required String title,
    required bool readOnly,
    VoidCallback? onTap
  }
){
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColor.shadowColor.withOpacity(0.15),
          spreadRadius: -1,
          blurRadius: 22,
          offset: const Offset(0, 10)
        ),
      ],
       borderRadius: BorderRadius.circular(10)

    ),
    child: TextFormField(
      controller: controller,
     maxLines: maxLine,
     keyboardType: TextInputType.text,
        autofocus: false,
        cursorColor: AppColor.lightgrey,
        readOnly: readOnly,
        style: const TextStyle(
     
     color:  AppColor.lightgrey
        ),
        decoration: InputDecoration(
     
     contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19),

     hintText: title,
     hintStyle:  TextStyle(
       color: AppColor.lightgrey.withOpacity(0.3),
       
     
     ),
    iconColor: readOnly == true ? AppColor.cyan : AppColor.lightgrey,
     filled: true,
     fillColor: AppColor.white,
     enabled: true,
     focusedBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(radius),
     borderSide: const BorderSide(
       color: AppColor.cyan
     ) 
     ),
     suffixIcon:Padding(
       padding:   const EdgeInsets.only(right: 30, top: 19, bottom:  19),
       child: GestureDetector(
        onTap: onTap,
        child: const ImageIcon( AssetImage('assets/profile/Edit.png'),)),
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
    ),
  );
}