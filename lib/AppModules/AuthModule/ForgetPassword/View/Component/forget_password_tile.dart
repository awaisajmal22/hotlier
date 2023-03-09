import 'package:flutter/material.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget forgetPasswordTile(
  {
    required String title,
    required String imageUrl,
    VoidCallback? onTap,
    required int selectedIndex, 
    required int index
  }
) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            margin: EdgeInsets.only( bottom: 25 ),
                              height: SizeConfig.heightMultiplier * 9.9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == index ? AppColor.cyan : AppColor.transparent,
                                  width: 1
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.shadowColor.withOpacity(0.15),
                                    spreadRadius: -1,
                                    blurRadius: 22,
                                    offset: Offset(0,4)
                                  )
                                ],
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10)
                              ),                              
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.5,
                                    width: 50.5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 4,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      appText(text: title, fontweight: FontWeight.w600, textColor: AppColor.textBlack, fontSize:  17.73, ),
                                      appText(text: 'Code Send to your $title', textColor: Color(0xffAcAdB9), fontSize: 14.83, fontweight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              )
                            ),
    );
  }