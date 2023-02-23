import 'package:flutter/material.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_button.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget artistTile({
  VoidCallback? onTap,
 required int selectedIndex,
 required int index,
 required String name,
 required String specialties,
 required String experience
}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
           
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.15),
                spreadRadius: -1,
                blurRadius: 22,
                offset: Offset(0,4)
              )
            ],
          color: selectedIndex == index ? AppColor.cyan : AppColor.white,
    
          ),
          padding: EdgeInsets.only(left: 20, top: 11, bottom: 9, right: 20),
          margin: EdgeInsets.symmetric(vertical: 9.5),
          height: SizeConfig.heightMultiplier * 18.5,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: SizeConfig.heightMultiplier * 8.2,
                    width: SizeConfig.widthMultiplier * 16.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2023/02/04/22/10/pipe-system-7768312__340.jpg'), fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(text: name, fontSize: 20, fontweight: FontWeight.w700, textColor: selectedIndex == index ? AppColor.white : AppColor.cyan),
                      appText(text: 'Specialties:  $specialties', fontSize: 15, fontweight: FontWeight.w400, textColor: selectedIndex == index ? AppColor.white : Color(0xff7A7A7A)),
                      appText(text: 'Experience: $experience', fontSize: 15, fontweight: FontWeight.w500, textColor: selectedIndex == index ? AppColor.white : Color(0xff7A7A7A)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.1,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white,
                   border: Border.all(
              color: selectedIndex == index ? AppColor.transparent : Color(0xffC2C3CB),
              width: 0.5
            ),
                ),
              child: appText(text: 'View', textColor: selectedIndex == index ? AppColor.cyan : Color(0xff7A7A7A),fontSize: 15, fontweight: FontWeight.w400), width: SizeConfig.widthMultiplier * 100, height: SizeConfig.heightMultiplier * 5.5)
            ],
          ),
        ),
    );
  }