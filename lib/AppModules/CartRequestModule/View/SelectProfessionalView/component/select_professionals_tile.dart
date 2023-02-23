import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../../common/app_color.dart';

Widget selectProfessionalsTile(
  {
    String name = '',
    String description = '',
    String url = '',
    GestureDetector? trailing,
    Color tileColor = AppColor.white,
    double width = 332,
    double margin = 8,
    VoidCallback? onTap,
    required bool check
  }
){
  return  GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: width,
      decoration: BoxDecoration(
  boxShadow:  [
                          BoxShadow(
                            color: tileColor.withOpacity(0.06), blurRadius: 20, spreadRadius: 6,
                            offset: Offset(0, 4)
                          )
                        ],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
                      title:       appText(text: name, textColor: AppColor.cyan, fontSize: 20, fontweight: FontWeight.w700),
                      subtitle: appText(text: description.toUpperCase(), textColor: AppColor.textBlack, fontSize: 15, fontweight: FontWeight.w500),
                      leading: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            
                            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
                            shape: BoxShape.circle
                          ),
                        ), 
                        trailing:Image(image: AssetImage(check == false ? 'assets/cart/plus.png': 'assets/cart/fillplus.png'), height: 23,width: 23,),
           
          ),
        
      // Row(
      //             children: [
      //               Container(
      //                 height: 64,
      //                 width: 64,
      //                 decoration: BoxDecoration(
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: AppColor.white.withOpacity(0.06), blurRadius: 20, spreadRadius: 6,
      //                       offset: Offset(0, 4)
      //                     )
      //                   ],
      //                   image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      //                   shape: BoxShape.circle
      //                 ),
      //               ), SizedBox(
      //                 width: 39,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   appText(text: name, textColor: AppColor.cyan, fontSize: 20, fontweight: FontWeight.w700),
      //                   appText(text: description.toUpperCase(), textColor: AppColor.textBlack, fontSize: 15, fontweight: FontWeight.w500),
      //                 ],
      //               )
      //             ],
      //           ),
    ),
  );
}