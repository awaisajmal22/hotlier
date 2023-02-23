import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartRequestModule/Model/select_professionals_model.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/formField.dart';
import 'package:hotlier/AppModules/CartRequestModule/ViewModel/cart_request_view_model.dart';
import 'package:hotlier/AppModules/ProfessionalsProjectModule/ViewModel/professionals_project_request_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../ProfessionalsProjectModule/View/ProfessionalProjectRequest/component/select_professionals_tile.dart';
import '../../../UserProfileModule/ViewModel/select_or_create_project_view_model.dart';
import 'component/select_professionals_tile.dart';

class SelectProfessionalView extends StatelessWidget {
   SelectProfessionalView({super.key,});
final yourProjectVM = Get.put(ProfessionalsProjectRequestViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteF5,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
          children: [
            Container(
              color: AppColor.whiteF5,
              child: Column(
                children: [
                   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         appButton(
                                onTap: (){
                                 Navigator.of(context).pop();
                                }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                buttonColor: AppColor.white),
                                SizedBox( width: 22,),
                                appText(text: 'Select Professionals', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),
                                
                               
                      ],
                    ),
              ),
              SizedBox(
                height: 29,
              ),
              formField(controller: yourProjectVM.searchProfessionalsController, title: 'Search Professionals By Name', maxLine: 1),
              SizedBox(
                height: 18,
              ),
                ],
              ),
            ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 74.3,
                
                child: ListView.builder(
                  itemCount: yourProjectVM.selectProfessionalsList.length,
                  itemBuilder: (context, index){
                  return Column(
                    children: [
                      Obx(
                        ()=> selectProfessionalsTile(

                          check: yourProjectVM.selectProfessionalsList[index].check.value,
                          width: SizeConfig.widthMultiplier * 100,
                          margin: 0,
                          name: yourProjectVM.selectProfessionalsList[index].name, 
                          description: yourProjectVM.selectProfessionalsList[index].description, 
                          url: yourProjectVM.selectProfessionalsList[index].imageUrl,
                      
                            onTap: (){
                              print(yourProjectVM.selectProfessionalsList[index].check.value);
                              if(yourProjectVM.selectProfessionalsList[index].check.value == true ) {
                           
                                yourProjectVM.professionals.remove(yourProjectVM.selectProfessionalsList[index]);
                              }
                              else {

                                yourProjectVM.professionals.add(yourProjectVM.selectProfessionalsList[index]);
                              }
                            yourProjectVM.selectProfessionalsList[index].check.value = !yourProjectVM.selectProfessionalsList[index].check.value ;
                              
                            },
                          ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  );
                }),
              )
          ],
      ),
        )),
    );
  }
}