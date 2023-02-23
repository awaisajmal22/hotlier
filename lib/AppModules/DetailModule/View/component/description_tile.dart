 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/app_color.dart';
import '../../ViewModel/detail_view_model.dart';

Widget descriptionTile({
  required DetailViewModel detailVM, 
  required String lessText, 
  required String moreText,
  double fontSize = 14,
  FontWeight descriptionfontWeight = FontWeight.w400
  }) {
    return Obx(
      ()=> RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          
          
        children: [
          detailVM.isReadMore.value == false ? TextSpan(
    
            style: TextStyle(
            color: AppColor.textBlack.withOpacity(0.7),
            fontWeight: descriptionfontWeight,
          fontSize: fontSize,
          
          ),
            text: lessText
          )
           : TextSpan(
            style: TextStyle(
            color: AppColor.textBlack.withOpacity(0.7),
            fontWeight: descriptionfontWeight,
          fontSize: fontSize,
          
          ),
             text: moreText,
          ),
         TextSpan(
          style: TextStyle(
            color: AppColor.cyan,
            fontWeight: FontWeight.w700,
          fontSize: fontSize,
          
          ),
          text: detailVM.isReadMore.value == false ? 'Read more..' : 'Read less..', 
          recognizer: TapGestureRecognizer()..onTap =() {
            detailVM.isReadMore.value = !detailVM.isReadMore.value;
          }
          ), 
          
        ]
      )),
    );
  }
