import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import 'package:path/path.dart' as path;


Widget pictureListViewTile(
  {
    required String imageUrl,
    required String size,
    VoidCallback? onTap,
    required int index,
    required int selectedImageIndex
  }
) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                                  alignment: Alignment.center,
                                  
                                  decoration: BoxDecoration(
                                    
                                    borderRadius: BorderRadius.circular(8),
                                    image: selectedImageIndex != index ? DecorationImage(
                                      image:  FileImage(File(imageUrl)),fit: BoxFit.cover)  : null
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
                                           borderRadius: BorderRadius.circular(8),
                                    image:  DecorationImage(
                                      image:  FileImage(File(imageUrl)),fit: BoxFit.cover) 
                                        ),
                                      ),
                                      Container(
                                        height: 97,
                                        width: 98,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(8),
                                    color: AppColor.black.withOpacity(0.6)
                                        ),
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
                                  ) : null
                                
                            ),
    );
  }
