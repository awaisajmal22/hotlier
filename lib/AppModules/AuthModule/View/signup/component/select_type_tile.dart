import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/ViewModel/SignupViewModel/signup_view_model.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_button.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget selectUserTile(
    {
      required SignUpViewModel signupVM,
      VoidCallback? addButton
    }
  ) {
    return Obx(()=>Column(
      children: [
         GestureDetector(
           onTap: (){
             signupVM.check.value = !signupVM.check.value;
           },
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
             decoration: BoxDecoration(
             color: Color(0xff323142),

               borderRadius: BorderRadius.circular(10)
             ),
             height: 65.55,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                         Obx(()=> Expanded(
                           child: appText(text: signupVM.selectedUser.value, textColor: AppColor.white, fontSize: 14, fontweight: FontWeight.w400))),
                        Container(
                         alignment: Alignment.center,
                         height: 13.88,
                         width: 13.88,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(
                             color: AppColor.white,
                             width: 1
                           )
                         ),
                         child: Obx(()=> FaIcon(signupVM.check.value ?FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown ,  size: 10, color: AppColor.white,)), )
               ],
             ),
           ),
         ),
        AnimatedOpacity(
                    
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                     
                    opacity: signupVM.check.value == true ? 1.0 : 0.0,
                    child:  signupVM.check.value == true ? Container(
                      
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff2E404D).withOpacity(0.15),
                            blurRadius: 22,
                            spreadRadius: -1,
                            offset: Offset(0, 4)
                          )
                        ]
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20,),
                      // margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 20, left: SizeConfig.widthMultiplier * 1.5),
                    
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(signupVM.selctUserList.length, (index) => GestureDetector(
                                onTap: (){
                                  signupVM.check.value = false;
                                  signupVM.selectedUser.value = signupVM.selctUserList[index];
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  color: AppColor.buttonColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      appText(text: signupVM.selctUserList[index],textAlign: TextAlign.left, textColor: AppColor.textBlack, fontSize: 15, fontweight: FontWeight.w400),
                                      SizedBox(
                                        height: 13,
                                      ),
                                     
                                    ],
                                  ),
                                ),
                              ))),
                    ) : null,
                        ),
      ],
    ),
              );
  }