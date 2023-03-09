import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';

Widget profileTile(
  {
    required String imageUrl,
    required String name,
    required String description
  }
) {
    return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                       child: Row(
                        children: [
                          CircleAvatar(
                                        backgroundImage: NetworkImage(imageUrl),
                                        radius: 25,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          
                                          children: [
                                            appText(text: name, textColor: AppColor.textBlack, fontSize: 18, fontweight: FontWeight.w700),
                                            appText(text: description, textColor: Color(0xffA2A2A2),textAlign: TextAlign.justify, fontSize: 14, fontweight: FontWeight.w400),
                                          
                                          ],
                                        ),
                                      )
                        ],
                       ),
                     );
  }