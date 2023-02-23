import 'package:flutter/cupertino.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget explore2ListViewTile(
  {
    required String imageUrl,
    required String title,
    required String price
  }
){
  return  Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 88,
                                      width: SizeConfig.widthMultiplier * 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)
                                        ),
                                        image: DecorationImage(image:AssetImage(imageUrl), fit: BoxFit.cover)
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 53.45),
                                      alignment: Alignment.centerLeft,
                                      height: 88,
                                      width: SizeConfig.widthMultiplier * 62,
                                      decoration: BoxDecoration(
                                        color: AppColor.buttonColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                        ),
                                        
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          appText(text: title, textColor: AppColor.textBlack, fontSize: 20, fontweight: FontWeight.w500),
                                          appText(text: price, textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 20, fontweight: FontWeight.w400),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          
    
}