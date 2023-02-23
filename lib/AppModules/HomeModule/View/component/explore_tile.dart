 import 'package:flutter/material.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';

Widget exploreTile({
    required String title, VoidCallback? seeAllButton
  }) {
    return Padding(
                padding: const EdgeInsets.only(left: 27, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(text: title, fontSize: 16, fontweight: FontWeight.w700, textColor: AppColor.textBlack),
                    GestureDetector(
                      onTap: seeAllButton,
                    child: appText(text: 'See All', fontSize: 13, fontweight: FontWeight.w700, textColor: AppColor.cyan),
                      
                    ),
                  ],
                ),
              );
  }
