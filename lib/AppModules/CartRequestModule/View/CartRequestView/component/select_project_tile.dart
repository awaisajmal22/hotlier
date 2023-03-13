import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_button.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';
import '../../../ViewModel/cart_request_view_model.dart';

Widget selectProjectTile(
    {
      required CartRequestViewModel cartrequestVM,
      VoidCallback? addButton
    }
  ) {
    return Obx(()=> Column(
      children: [
         Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          cartrequestVM.projectcheck.value = !cartrequestVM.projectcheck.value;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                          decoration: BoxDecoration(
                          color: AppColor.cyan,
                      
                            borderRadius: BorderRadius.circular(10)
                          ),
                          height: 54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                      Obx(()=> Expanded(
                                        child: appText(text: cartrequestVM.projectName.value, textColor: AppColor.white, fontSize: 14, fontweight: FontWeight.w400))),
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
                                      child: Obx(()=> FaIcon(cartrequestVM.projectcheck.value ?FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown ,  size: 10, color: AppColor.white,)), )
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(
                      width: 7,
                    ),
                    appButton(onTap: addButton, widget: const ImageIcon(AssetImage('assets/cart/plus.png'),color: AppColor.cyan,), height: 54,width: 66, buttonColor: AppColor.buttonColor,radius: 10 )
                  ],
                ),
        AnimatedOpacity(
                    
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                     
                    opacity: cartrequestVM.projectcheck.value == true ? 1.0 : 0.0,
                    child:  cartrequestVM.projectcheck.value == true ? Container(
                      
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20,),
                      margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 20, left: SizeConfig.widthMultiplier * 1.5),
                    
                      child: Column(
                              children: List.generate(cartrequestVM.projectNameList.length, (index) => GestureDetector(
                                onTap: (){
                                  cartrequestVM.projectcheck.value = false;
                                  cartrequestVM.projectName.value = cartrequestVM.projectNameList[index];
                                },
                                child: Container(
                                  color: AppColor.buttonColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      appText(text: cartrequestVM.projectNameList[index], textColor: AppColor.textBlack, fontSize: 15, fontweight: FontWeight.w400),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                     index != cartrequestVM.projectNameList.length -1  ? Container(
                                        width: SizeConfig.widthMultiplier * 100,
                                        height: 1,
                                        color: const Color(0xffDBDBDB),
                                      ) : Container()
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