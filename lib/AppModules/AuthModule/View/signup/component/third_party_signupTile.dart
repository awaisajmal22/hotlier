import 'package:flutter/material.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_button.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget thirdPartySignUpTile() {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.widthMultiplier * 20,
              height: 1,
              color: AppColor.black,
            ),
             SizedBox(
              width: SizeConfig.widthMultiplier * 2.47,
            ),
            appText(text: 'Or', textColor: AppColor.darkgrey, fontSize: 17, fontweight: FontWeight.w500),
 SizedBox(
              width: SizeConfig.widthMultiplier * 2.47,
            ),
            Container(
              width: SizeConfig.widthMultiplier * 20,
              height: 1,
              color: AppColor.black,
            ),
          ],
        ),
        SizedBox(
          height: 16.63,
        ),
        Row(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            appButton(onTap: (){}, widget: Image(image: AssetImage('assets/auth/google.png'), fit: BoxFit.cover,), width:35.27, height: 35.34),
            SizedBox(
              width: 25.2,
            ),
            appButton(onTap: (){}, widget: Image(image: AssetImage('assets/auth/facebook.png'), fit: BoxFit.cover,), width:35.27, height: 35.34),
 SizedBox(
              width: 25.2,
            ),
            appButton(onTap: (){}, widget: Image(image: AssetImage('assets/auth/twitter.png'), fit: BoxFit.cover,), width:35.27, height: 35.34),
          ],
        ),
            ],
           );
  }