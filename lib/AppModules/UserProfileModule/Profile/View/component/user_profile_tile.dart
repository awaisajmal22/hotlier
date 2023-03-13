import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget userProfileTile({
  required String title,
  required String icon,
   required int selectedIndex,
   VoidCallback? onTap,
   required int index
}) {
    return Container(
      alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColor.cyan : AppColor.white,

                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor.withOpacity(0.15),
                    spreadRadius: -1,
                    blurRadius: 22,
                    offset: Offset(0, 10),
                  
                  )
                ],
              ),
              height: SizeConfig.heightMultiplier * 7.5,
              child: ListTile(
                onTap: onTap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                iconColor: selectedIndex == index ? AppColor.white : Color(0xff323142),
                leading: ImageIcon(AssetImage(icon),),
                title: appText(text: title, fontSize: 18, fontweight: FontWeight.w400,textColor: selectedIndex == index ? AppColor.white : Color(0xff323142)),
                trailing: index == 6 ? null : FaIcon(FontAwesomeIcons.chevronRight, color: selectedIndex == index ? AppColor.white : Color(0xff323142), size: 24,),
              ),
              
            );
  }