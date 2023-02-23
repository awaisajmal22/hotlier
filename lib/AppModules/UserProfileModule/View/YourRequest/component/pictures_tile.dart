import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:hotlier/common/app_color.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/size_config.dart';

Widget picturesTile(
  {
    required String imageUrl,
    required String name,
    required String size
  }
) {
    return Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            margin: EdgeInsets.symmetric(horizontal: 8.5),
                            height: 97,
                            width: SizeConfig.widthMultiplier * 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: (){
                                              GallerySaver.saveImage(imageUrl);
                                            },
                                            child: FaIcon(FontAwesomeIcons.arrowDown, size: 12,color: AppColor.white,)),
                                        ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                   Text( 
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                             name, 
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700
                                            ),),
                                            appText(text: size, textColor: AppColor.white, fontSize: 12, fontweight: FontWeight.w700)
                          

                                  ],
                                )
                              ],
                            ),
                          );
  }
 