import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartModule/View/cart_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/Model/your_request_model.dart';
import 'package:hotlier/AppModules/UserProfileModule/Request/View/request_View.dart';
import 'package:hotlier/AppModules/UserProfileModule/CreateOrSelectProject/View/component/create_project_tile.dart';
import 'package:hotlier/AppModules/UserProfileModule/CreateOrSelectProject/ViewModel/select_or_create_project_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../ProfessionalsProjectModule/View/ProfessionalProjectRequest/professional_project_request_view.dart';
import 'component/request_project_tile.dart';

class CreateOrSelectProjectView extends StatelessWidget {
CreateOrSelectProjectView({super.key, required this.check});
  final selectOrCreateVM = Get.put(RequestProjectViewModel());
  final int check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:   MediaQuery.of(context).viewInsets.bottom !=0? null :Container(
        padding: EdgeInsets.symmetric( horizontal: 22, vertical: 10),
        height: SizeConfig.heightMultiplier * 10,
        width: SizeConfig.widthMultiplier * 100,
        child: appButton(onTap: (){
          
          createProjectTile(controller: selectOrCreateVM.projectController, onTap: (){
                      selectOrCreateVM.allRequestList.add(AllRequestModel(date: "23, may, 2023", projectModel: [
                        ProjectModel(projectName: selectOrCreateVM.projectController.text, projectDataModel: [
                          ProjectDataModel(imageUrl: 'https://images.unsplash.com/photo-1672595527737-fe40c5f93b12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60', 
                          name: 'Ali', description: "description", isComplete: false.obs)
                        ])
                      ]));
            print(selectOrCreateVM.allRequestList.length);
                      
                      Get.back();
                  });
        }, widget: appText(text: 'Create a Project', fontSize: 16, fontweight: FontWeight.w400, textColor: Color(0xffF3F5F6),), 
        height:  SizeConfig.heightMultiplier * 10,
        width: SizeConfig.widthMultiplier * 100,
         buttonColor: AppColor.cyan
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                     appButton(
                                          onTap: (){
                                           Navigator.of(context).pop();
                                          }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                          buttonColor: AppColor.white),
                                          SizedBox( width: 22,),

                                          Expanded(child: appText(text: 'Create or Select Project', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack)),     
                                ],
                              ),
            ),
           SizedBox(
              height: SizeConfig.heightMultiplier * 76.86,
              child: ListView.builder(
              padding: EdgeInsets.only(top: 38),
              
                itemCount: selectOrCreateVM.allRequestList.length,
                itemBuilder: (context, index){
                return Column(
                  children: [
                     Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xffC2C3CB),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 4.5,),
                        appText(text: selectOrCreateVM.allRequestList[index].date, fontSize: 20, fontweight: FontWeight.w400,textAlign: TextAlign.start, textColor: AppColor.textBlack.withOpacity(0.6)),
                        SizedBox(
                          width: 4.5,
                        ),
                        Expanded(
                          child: Container(
                              color: Color(0xffC2C3CB),
                              height: 1,
                            ),
                        ),
                        ],
                       ),
                       Obx(
                         ()=> Column(
                            children: List.generate(
                                         
                              growable: true,
                              selectOrCreateVM.allRequestList[index].projectModel.length, (ind){
                              return  requestProjectTile(
                                onTap: (){
                                  if(check == 0){
 Get.to(CartView(
                                    projectName: selectOrCreateVM.allRequestList[index].projectModel[ind].projectName,
                                  ));
                                  }else if(check == 1){
                                    Get.to(RequestView(date: selectOrCreateVM.allRequestList[index].date, data: selectOrCreateVM.allRequestList[index].projectModel[ind].projectDataModel));
                                  }
                                  else if(check == 2){
                                    Get.to(  ProfessionalRequestView(projectName: selectOrCreateVM.allRequestList[index].projectModel[ind].projectName));
                                  }
                                 
                                },
                                  title: selectOrCreateVM.allRequestList[index].projectModel[ind].projectName
                                                      
                              );
                            }
                         ),
                           ),
                       ),
                       
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }


}