 import 'package:flutter/material.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';

Widget brandsProductTile(
  {
    required String imageUrl,
    required String productName
  }
) {
    return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.5),
            height: 104,
            width: 71,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              children: [
                Container(
                  height: 69.25,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)
                    ),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                  )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 34.75,
                  alignment: Alignment.center,
                  child: appText(
                    textAlign: TextAlign.center,
                    text: productName, 
                    fontSize: 10, fontweight: FontWeight.w400, 
                    textColor: AppColor.textBlack
                    )
                )
              ],
            ),
          );
  }
