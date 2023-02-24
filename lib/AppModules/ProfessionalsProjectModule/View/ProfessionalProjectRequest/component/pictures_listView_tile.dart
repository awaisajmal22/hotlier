import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import 'package:path/path.dart' as path;


Widget picturesListViewTile({
  required String imageUrl,
  required String size,
  VoidCallback? onTap,
  required int selectedImageIndex,
  required int index
}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      // color: AppColor.black.withOpacity(0.6),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.black.withOpacity(0.6)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      image: selectedImageIndex != index ? DecorationImage(image: FileImage(File(imageUrl)),fit: BoxFit.cover) : null
                                    ),
                                    margin: const EdgeInsets.symmetric(horizontal: 8.5),
                                    height: 97,
                                    width: 98,
                                    child: selectedImageIndex == index ? Stack(
                                      children: [
                                        Container(
                                          height: 97,
                                          width: 98,
                                          decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.black.withOpacity(0.6)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(image: FileImage(File(imageUrl)),fit: BoxFit.cover)
                                    ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                      color: AppColor.black.withOpacity(0.6),
    
                                    
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                          height: 97,
                                          width: 98,
    
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                             
                                              Text( 
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    path.basename(imageUrl), 
                                                  style: const TextStyle(
                                                    color: AppColor.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700
                                                  ),),
                                                  appText(text: size, textColor: AppColor.white, fontSize: 12, fontweight: FontWeight.w700)
                                                                
                                            ],
                                          ),
                                        ),
                                      ],
                                    )  : null
                                  
                              ) ,
    );
  }