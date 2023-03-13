 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';

Widget dealerProileTile({
    required String name,
    required String imageUrl,
    required String message,
     
  }) {
    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                              backgroundImage: NetworkImage(imageUrl),
                                              radius: 25,
                                            ),
                                            const SizedBox(
                                              width: 22,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                            appText(text: name, textColor: AppColor.textBlack, fontSize: 18, fontweight: FontWeight.w700),
                                            Row(
                                              children: [
                                            appText(text: 'to John Wick', textColor: const Color(0xffACADB9), fontSize: 10, fontweight: FontWeight.w400),
                                            const Icon(Icons.keyboard_arrow_down, color: Color(0xffACADB9),size: 13,)
                                                  
                                              ],
                                            )
                                              ],
                                            ),
                                  ],
                                ),
                                            const FaIcon(FontAwesomeIcons.ellipsisVertical, color: AppColor.textBlack,)

                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            appText(text: message,
                            textColor: AppColor.textBlack,
                            fontSize: 14, fontweight: FontWeight.w400,textAlign: TextAlign.justify
                            ), 
                          ],
                        ),
                      );
  }