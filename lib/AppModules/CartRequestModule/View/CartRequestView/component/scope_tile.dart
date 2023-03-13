import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';
import '../../../ViewModel/cart_request_view_model.dart';

Widget selectScopeTile(
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
                          cartrequestVM.scopecheck.value = !cartrequestVM.scopecheck.value;
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
                                      Obx(()=> appText(text: cartrequestVM.scope.value, textColor: AppColor.white, fontSize: 14, fontweight: FontWeight.w400)),
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
                                      child: Obx(()=> FaIcon(cartrequestVM.scopecheck.value ?FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown ,  size: 10, color: AppColor.white,)), )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        AnimatedOpacity(
                    
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                     
                    opacity: cartrequestVM.scopecheck.value == true ? 1.0 : 0.0,
                    child:  cartrequestVM.scopecheck.value == true ? Container(
                      
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20,),
                    
                      child: Column(
                              children: List.generate(cartrequestVM.scopeList.length, (index) => GestureDetector(
                                onTap: (){
                                  cartrequestVM.scopecheck.value = false;
                                  cartrequestVM.scope.value = cartrequestVM.scopeList[index];
                                },
                                child: Container(
                                  color: AppColor.buttonColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      appText(text: cartrequestVM.scopeList[index], textColor: AppColor.textBlack, fontSize: 15, fontweight: FontWeight.w400),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                     index != cartrequestVM.scopeList.length - 1  ? Container(
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