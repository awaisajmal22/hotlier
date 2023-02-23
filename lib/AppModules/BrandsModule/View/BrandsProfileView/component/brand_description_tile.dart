import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/BrandsModule/ViewModel/brands_profile_view_model.dart';

import '../../../../../common/app_color.dart';

Widget brandDescriptionTile({
  required BrandsProfileViewModel brandsProfileVM, 
  required String lessText, 
  required String moreText,
  double fontSize = 12,
  FontWeight descriptionfontWeight = FontWeight.w400
  }) {
    return Obx(
      ()=> RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          
          
        children: [
          brandsProfileVM.isReadMore.value == false ? TextSpan(
    
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
          text: brandsProfileVM.isReadMore.value == false ? 'Read more..' : 'Read less..', 
          recognizer: TapGestureRecognizer()..onTap =() {
            brandsProfileVM.isReadMore.value = !brandsProfileVM.isReadMore.value;
          }
          ), 
          
        ]
      )),
    );
  }
