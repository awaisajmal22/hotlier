

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

filterBottomSheet(
  {
    required List colors,
    required RxInt selectedColor,
    required List material,
    required RxInt selectedMaterial
  }
){
  Get.bottomSheet(
    barrierColor: AppColor.transparent,
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.white.withOpacity(0.06),
            spreadRadius: 6,
            blurRadius: 20,
            offset: const Offset(11, 4)
          )
        ]
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(text: 'Color', fontSize: 16, fontweight: FontWeight.w600, textColor: const Color(0xff191919)),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            direction: Axis.horizontal,
            children: List.generate(
              growable: true,
              colors.length,
             (index) => GestureDetector(
              onTap: (){
                selectedColor.value = index;
                print(selectedColor.value);
              },
               child: Obx(
                 ()=> Container(
                  height: 44,
                  width: 79,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedColor.value == index ? AppColor.cyan : AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selectedColor == index ? AppColor.transparent : const Color(0xffDADADA),
                      width: 1
                    )
                  ),
                  child: appText(text: colors[index], textColor: selectedColor.value == index ? AppColor.white : const Color(0xff191919), fontSize: 14, fontweight: FontWeight.w500),
                             ),
               ),
             ))),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
           appText(text: 'Material', fontSize: 16, fontweight: FontWeight.w600, textColor: const Color(0xff191919)),
          const SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            direction: Axis.horizontal,
            children: List.generate(
              growable: true,
              material.length,
             (index) => GestureDetector(
              onTap: (){
                selectedMaterial.value = index;
                print(selectedMaterial.value);
              },
               child: Obx(
                 ()=> Container(
                  height: 44,
                  width: 79,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedMaterial.value == index ? AppColor.cyan : AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selectedMaterial == index ? AppColor.transparent : const Color(0xffDADADA),
                      width: 1
                    )
                  ),
                  child: appText(text: material[index], textColor: selectedMaterial.value == index ? AppColor.white : const Color(0xff191919), fontSize: 14, fontweight: FontWeight.w500),
                             ),
               ),
             ))),
             SizedBox(
              height: SizeConfig.heightMultiplier * 2,
             ),
             appButton(onTap: (){
              Get.back();
             }, widget: appText(text: 'Select',fontSize: 16, fontweight:  FontWeight.w500, textColor:const Color(0xffF3F5F6)),
             width: SizeConfig.widthMultiplier * 100,
             height: 66,
             radius: 14,buttonColor: AppColor.cyan
             )
          
        ],
      ),
    )
  );
}