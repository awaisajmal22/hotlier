import 'package:flutter/material.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget addressTile(
  {
    required String businesstitle,
    required String location,
    required String name
  }
) {
    return Container(
                  alignment: Alignment.center,
                  height: SizeConfig.heightMultiplier * 20,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.cyan,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -1,
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                      color: AppColor.shadowColor.withOpacity(0.15)
                    ),
                    
                  ],
                  
                 ),
                 padding: EdgeInsets.only(
                  top: SizeConfig.heightMultiplier * 5,
                  left: SizeConfig.widthMultiplier * 7,
                  right: SizeConfig.widthMultiplier * 7,
                  ),
                  width: SizeConfig.widthMultiplier * 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      appText(text: name, textColor: AppColor.white, fontSize: 20, fontweight: FontWeight.w700),
                     
                      Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Image(image: AssetImage('assets/profile/business.png'), width: 21, height: 21,color: AppColor.white,),
                            const SizedBox(width: 14,),
                             Expanded(child: appText(text: 'Business: $businesstitle',textAlign: TextAlign.start, fontSize: 15, textColor: AppColor.white, fontweight: FontWeight.w400))
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(image: AssetImage('assets/profile/Location.png'), width: 15.36, height: 18.27,color: AppColor.white,),
                            const SizedBox(width: 18,),
                             Expanded(child: appText(text: 'Address: $location',textAlign: TextAlign.start, fontSize: 15, textColor: AppColor.white, fontweight: FontWeight.w400))
                          ],
                        )
                      ],
                      ),
                    ],
                  ),
                );
  }