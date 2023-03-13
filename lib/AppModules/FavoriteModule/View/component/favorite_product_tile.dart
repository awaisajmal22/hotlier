import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';

Widget favoriteProductTile(
  {
    required String imageUrl,
    required String title,
    required String price,
    VoidCallback? onTapisfavorite
  }
) {
    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7.5),
                        decoration: BoxDecoration(
                          color: AppColor.buttonColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        height: 210,
                        width: 170,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12
                              ),
                              alignment: Alignment.topRight,
                              height: 145,
                              width: 175,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  
                                ),
                                image: DecorationImage(image: AssetImage(imageUrl),fit: BoxFit.cover)
                              ),
                              
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 65,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  appText(text: title, fontSize: 16, fontweight: FontWeight.w500, textColor: AppColor.textBlack),
                                  appText(text: price, fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.textBlack),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
  }