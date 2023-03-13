import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartModule/ViewModel/cart_view_model.dart';
import 'package:hotlier/common/app_button.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';

Widget cartTile({
  required String imageUrl,
  required int itemcCount,
  VoidCallback? increament,
  VoidCallback? decreament,
  required String title,
  required String description,
  required double price

  }
) {
    return itemcCount <= 0 ? Container() : Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 7
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:  10),
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(12),
                                 color: AppColor.buttonColor
                              ),
                              width: SizeConfig.widthMultiplier * 100,
                              height: 102,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                    height: 81,
                                    width: 81,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Column(
                                    
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          
                                      appText(text: title, textColor: AppColor.cyan, fontSize: 20, fontweight: FontWeight.w600),
                                      appText(text: description, textColor: const Color(0xff747474),fontSize: 12, fontweight: FontWeight.w400),
                                        ],
                                      ),
                                       Row(
                                          children: [
                                        itemcCount <= 0 ? Container(
                                          width: 18,
                                        ) :  GestureDetector(
                                            onTap: decreament,
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                                              height: 18.33,
                                              width: 18.33,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: const DecorationImage(image: AssetImage('assets/cart/minus.png'),fit: BoxFit.cover)
                                              ),
                                              
                                            ),
                                            
                                          ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            appText(text: itemcCount.toString(), textColor: AppColor.black, fontSize: 15, fontweight: FontWeight.w400),
                                          const   SizedBox(
                                              width: 16,
                                            ),
                                            GestureDetector(
                                            onTap: increament,
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                                              height: 18.33,
                                              width: 18.33,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: const DecorationImage(image: AssetImage('assets/cart/plus.png'),fit: BoxFit.cover)
                                              ),
                                              
                                            ),
                                            
                                          ),
                                          ],
                                        ),
                                      
                                    ],
                                  ),
                                    ],
                                  ),
                                  
                                 
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    
                                    children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: appText(text: '\$ $price', textColor: AppColor.cyan, fontSize: 20, fontweight: FontWeight.w500))

                                    ],
                                  )
                                ],
                              ),
                            );
  }
