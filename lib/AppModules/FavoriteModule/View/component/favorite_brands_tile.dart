import 'package:flutter/material.dart';
import 'package:hotlier/common/app_color.dart';

import '../../../../common/app_Text.dart';

Widget favoriteBrandsTile(
  {
    required String imageUrl,
    required String title,
    required String subtitle
  }
) {
    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7.5),
                        decoration: BoxDecoration(
                          color: AppColor.buttonColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        height: 181,
                        width: 136,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                                backgroundImage:  NetworkImage(imageUrl),),
                                SizedBox(
                                  height: 4,
                                ),
                              
                              
                          
                            appText(text: title, fontSize: 16, fontweight: FontWeight.w500, textColor: AppColor.textBlack),
                            appText(text: subtitle, fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.textBlack),
                          ],
                        ),
                      );
  }