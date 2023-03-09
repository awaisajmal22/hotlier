import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget requestTile({required int index, required List data,VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
                                children: [
                                  Container(
                                  alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                                    height: 90,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(data[index].imageUrl),
                                          radius: 25,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            appText(text: data[index].name, textColor: AppColor.cyan, fontSize: 18, fontweight: FontWeight.w700),
                                            appText(text: data[index].description, textColor: Color(0xffA2A2A2), fontSize: 13, fontweight: FontWeight.w500),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Obx(
                                              ()=> Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                color: data[index].isComplete.value == false ? Color(0xffFF5555) : Color(0xff35AD4F),
    
                                                ),
                                                height: 23,
                                                width: SizeConfig.widthMultiplier * 20,
                                                child: appText(text: data[index].isComplete.value == false ? 'Pending' : 'Complete', textColor: AppColor.white, fontSize: 12, fontweight: FontWeight.w500,),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
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
    );
  }