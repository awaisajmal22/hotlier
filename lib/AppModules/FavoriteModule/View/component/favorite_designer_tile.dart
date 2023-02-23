import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';

Widget favoriteDesignerTile(
  {
    required String imageUrl,
    required String title,
    required String subtitle
  }
) {
    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        height: 210,
                        width: 170,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                                backgroundImage:  NetworkImage(imageUrl),),
                              
                              
                          
                            Container(
                              alignment: Alignment.center,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  appText(text: title, fontSize: 16, fontweight: FontWeight.w500, textColor: AppColor.textBlack),
                                  appText(text: subtitle, fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.textBlack),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
  }