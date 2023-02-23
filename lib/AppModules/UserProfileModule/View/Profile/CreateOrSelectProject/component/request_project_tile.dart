 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/app_Text.dart';
import '../../../../../../common/app_color.dart';
import '../../../../../../common/size_config.dart';
import '../../../../ViewModel/select_or_create_project_view_model.dart';
import '../../Request/request_View.dart';

Widget requestProjectTile({
    required String title,
    VoidCallback? onTap
  }) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
                              onTap: onTap,
                              child: Row(
                                children: [
                                  Container(

alignment: Alignment.centerLeft,                  
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                                    height: 81,
                                    width: SizeConfig.widthMultiplier * 69.8,
                                    decoration: BoxDecoration(
                                      
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.shadowColor.withOpacity(0.16),
                                        spreadRadius: -9,
                                        blurRadius: 18,
                                        offset: Offset(0, 10)
                                      )
                                    ],
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10)
                                    )
                                    ),
                                    child: appText(text: title, textColor: AppColor.textBlack),
                                  ),
                                   Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                  color: AppColor.cyan,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )),
                                  height: 81,
                                  width: SizeConfig.widthMultiplier * 20,
                                  child: appText(text: 'View Details', textColor: AppColor.white, fontSize: 15, fontweight: FontWeight.w500,textAlign: TextAlign.center),
                                ),
                                ],
                              ),
                            
                          
      ),
    );
  }