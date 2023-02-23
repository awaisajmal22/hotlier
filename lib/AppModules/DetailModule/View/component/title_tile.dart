 import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';

Widget titleTile(BuildContext context, {required String title, required String subtitle, required String description}) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appButton(
                        onTap: (){
                         Navigator.of(context).pop();
                        }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                        buttonColor: AppColor.white),
                        Column(
                          children: [
                        appText(text: title.toUpperCase(), textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 20, fontweight: FontWeight.w400),
                         Align(
                    alignment: Alignment.topCenter,
                    child: appText(text: subtitle, fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: appText(text: description, fontSize: 10, fontweight: FontWeight.w400, textColor: AppColor.textBlack.withOpacity(0.6)
                    
                    )),
                          ],
                        ),
                        appButton(onTap: (){}, widget: ImageIcon(AssetImage('assets/navbar/Heart.png'), size: 19,), height: 45,width: 45, buttonColor: AppColor.white),
                ],
              ),
            );
  }