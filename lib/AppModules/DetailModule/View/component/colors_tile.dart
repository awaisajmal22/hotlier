import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/DetailModule/ViewModel/detail_view_model.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';

Widget colorsTile({required DetailViewModel detailVM}){
  return Padding(
      padding: const EdgeInsets.only(left: 0, right: 22),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             appText(text: 'Avalaible Colors', fontSize: 14, fontweight: FontWeight.w400, textColor: AppColor.textBlack.withOpacity(0.6)),
              SizedBox(
           height: 12,
          ),
             Container(
               width: SizeConfig.widthMultiplier * 61,
               height: 24,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                 
                 children: List.generate(
                   growable: true,
                   detailVM.colors.length, (index) => GestureDetector(
                   onTap: (){
                     detailVM.selectedColor.value = index;
                   },
                   child: Obx(
                     ()=> Container(
                       margin: EdgeInsets.symmetric(horizontal: 3),
                       height: 24,
                       width: 24,
                       decoration: BoxDecoration(
                         color: detailVM.colors[index],
                         borderRadius: BorderRadius.circular(detailVM.selectedColor == index ? 4 : 100),
                         border: Border.all(
                           width: 2,
                           color: detailVM.selectedColor == index ? Color(0xff323142) : Colors.transparent
                         )
                       ),
                     ),
                   ),
                 )),
               ),
             ),
           ],
          ),
          SizedBox(
           height: 12,
          ),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             
             appText(text: 'From', fontSize: 14, fontweight: FontWeight.w400, textAlign: TextAlign.left, textColor: AppColor.textBlack.withOpacity(0.6)),
             SizedBox(height: 12,),
             appText(text: '\$35.00', fontSize: 14, fontweight: FontWeight.w700, textAlign: TextAlign.left, textColor: AppColor.textBlack),

           ],
          )
        ],
      ),
    );
}