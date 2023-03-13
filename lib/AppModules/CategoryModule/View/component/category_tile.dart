import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';

Widget categoryTile(int buttonIndex, int index, List<dynamic> productList) {
  return Column(
                            children: [
                               Container(
                             
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  alignment: Alignment.center,
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: buttonIndex == index ? AppColor.cyan : AppColor.buttonColor
                                  ),
                                  child: Image(image: AssetImage(productList[index].icon), color: buttonIndex == index ? AppColor.white : AppColor.darkgrey),
                                ),
                              const SizedBox(
                                height: 9,
                              ),
                              appText(text: productList[index].name,textAlign: TextAlign.center, fontweight: FontWeight.w400, fontSize: 12, textColor: AppColor.darkgrey)
                            ],
                          );
}