 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/SetupArtistModule/VIewModel/setupArtist2_view_model.dart';

import '../../../../../common/app_color.dart';


Widget setupArtistdescriptionTile({
  required SetupArtist2ViewModel setupArtist2VM, 
  required String lessText, 
  required String moreText,
  double fontSize = 14,
  FontWeight descriptionfontWeight = FontWeight.w400
  }) {
    return Obx(
      ()=> RichText(
        softWrap: true,
        textAlign: TextAlign.justify,
        text: TextSpan(
          
          
        children: [
          setupArtist2VM.isReadMore.value == false ? TextSpan(
    
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
          text: setupArtist2VM.isReadMore.value == false ? 'Read more..' : 'Read less..', 
          recognizer: TapGestureRecognizer()..onTap =() {
            setupArtist2VM.isReadMore.value = !setupArtist2VM.isReadMore.value;
          }
          ), 
          
        ]
      )),
    );
  }
