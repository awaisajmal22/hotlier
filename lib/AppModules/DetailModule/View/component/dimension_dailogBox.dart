import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/DetailModule/ViewModel/detail_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_button.dart';

 dimensionDailogBox(BuildContext context, {required DetailViewModel detailVM}){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (contexts) {

      return AlertDialog(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19)
        ),
       content: Column(
        mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.widthMultiplier * 100,
              color: AppColor.white,
              child: Column(
                children: [
                  Align(
                    alignment:Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: ImageIcon(AssetImage('assets/profile/close.png')),
                    ),
                  ),
                  SizedBox(
                    height: 14.25,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dimensionFormField(
                         prefixIcon: FaIcon(FontAwesomeIcons.arrowsLeftRight, size: 16,),

                        label: 'Width',
                        onSubmit: (value){

                      }, controller: detailVM.dimension1Controller, ),
                      
                      
                       dimensionFormField(
                        prefixIcon: FaIcon(FontAwesomeIcons.arrowsUpDown,size: 16,),


                        onSubmit: (value){

                       }, controller: detailVM.dimension2Controller, label: 'Height', ),
                      
                       dimensionFormField(
                       prefixIcon: FaIcon(FontAwesomeIcons.upRightAndDownLeftFromCenter, size: 16,),

                         label: 'Depth',
                         onSubmit: (value){

                       }, controller: detailVM.dimension3Controller, )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
             appButton(
                    buttonColor: AppColor.cyan,
                    onTap: (){
                     Get.back();
                      detailVM.dimension.value = "${'W: '+detailVM.dimension1Controller.text +' ; H: ' + detailVM.dimension2Controller.text +' ; D: '+ detailVM.dimension3Controller.text}";
                  }, widget: FittedBox(
                    child: appText(
                      text: 'Add Dimension', 
                      textColor: Color(0xffF3F5F6), fontSize: 16,
                       fontweight: FontWeight.w400)), height: 46, 
                       width: SizeConfig.widthMultiplier * 100,
              widgetAlignment: Alignment.center,
              radius: 4
              ),
            
          ],
        ),
      );
    },

  );
}

Widget dimensionFormField(
  {
    required String label,
    required Function(String?)? onSubmit,
    TextInputAction textInputAction = TextInputAction.next,
    required TextEditingController controller,
    required Widget prefixIcon, 
   
    double radius = 4
  }
){
  return Container(
    margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 0.7),
    width: SizeConfig.widthMultiplier * 20,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(text: label, fontSize: 14, fontweight: FontWeight.w400, textColor: AppColor.gery5D),
                      SizedBox(
                        height: 3,
                      ),
        TextFormField(
          textDirection: TextDirection.rtl,
          onFieldSubmitted: onSubmit as String? Function(String?),
          keyboardType: TextInputType.number,
          autofocus: false,
          textAlign: TextAlign.right,
          textInputAction: textInputAction,
          inputFormatters: [LengthLimitingTextInputFormatter(3)],
          controller: controller,
          cursorColor: AppColor.gery5D,
          cursorHeight: 20,
        textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: AppColor.gery5D,),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 13,bottom: 13, left: 5),
              child: prefixIcon,
            ),
            
            filled: true,
            fillColor:AppColor.greyWhite,
            hintTextDirection: TextDirection.ltr,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColor.gery5D),
                contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 3),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(width: 1, color: AppColor.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(width: 1, color: AppColor.transparent )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(width: 1, color: AppColor.transparent)),
          ),
        ),
      ],
    ),
  );
}

