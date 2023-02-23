import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/ProfessionalsProjectModule/ViewModel/professionals_project_request_view_model.dart';
import 'package:hotlier/AppModules/UserProfileModule/ViewModel/select_or_create_project_view_model.dart';
import 'package:intl/intl.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../../../CartRequestModule/View/CartRequestView/component/attchment_button.dart';
import '../../../CartRequestModule/View/CartRequestView/component/create_project.dart';
import '../../../CartRequestModule/View/CartRequestView/component/date_picker_tile.dart';
import '../../../CartRequestModule/View/CartRequestView/component/formField.dart';
import '../../../CartRequestModule/View/CartRequestView/component/scope_tile.dart';
import '../../../CartRequestModule/View/CartRequestView/component/select_project_tile.dart';
import '../../../CartRequestModule/View/SelectProfessionalView/select_professional_view.dart';
import 'component/select_professionals_tile.dart';
import 'package:path/path.dart' as path;


class ProfessionalRequestView extends StatelessWidget {
   ProfessionalRequestView({super.key, required  this.projectName});
  final professionalProjectRequestVM = Get.put(ProfessionalsProjectRequestViewModel());
  String projectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: MediaQuery.of(context).viewInsets.bottom != 0 ? null : Container(
        
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 12,
        child: appButton(onTap: (){
        }, widget: appText(text: 'Request Proposal', fontSize: 16, fontweight: FontWeight.w400, textColor: Color(0xffF3F5F6),), 
        height:  SizeConfig.heightMultiplier * 8.2,
        width: SizeConfig.widthMultiplier * 100,
         buttonColor: AppColor.cyan
        ),
        
      ) ,
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       appButton(
                              onTap: (){
                               Navigator.of(context).pop();
                              }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                              buttonColor: AppColor.white),
                              SizedBox( width: 22,),
                              appText(text: 'Your Request', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),
                              
                             
                    ],
                  ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(text: 'Select Professional', textColor: AppColor.textBlack.withOpacity(0.6),fontSize: 14, fontweight: FontWeight.w400),
                  Row(
                    children: [
                  appText(text: 'Add', textColor: AppColor.textBlack.withOpacity(0.6),fontSize: 14, fontweight: FontWeight.w400),
                  SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: (){
                      print(professionalProjectRequestVM.professionals.length);
                      Get.to(SelectProfessionalView(
                      ));
                    },
                    child: ImageIcon(AssetImage('assets/cart/plus.png'), size: 20, color: AppColor.cyan,),
                  )
                  

                    ],
                  )
                  
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
             Obx(
              ()=> SizedBox(
                  height: professionalProjectRequestVM.professionals.isEmpty ? 0 : SizeConfig.heightMultiplier * 12,
                   child: ListView.builder(
                      itemCount: professionalProjectRequestVM.professionals.length,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                      return  professionalsTile(
                        projectName: professionalProjectRequestVM.professionals[index].projectName,
                          width: SizeConfig.widthMultiplier * 80,
                          url: professionalProjectRequestVM.professionals[index].imageUrl,
                          name: professionalProjectRequestVM.professionals[index].name,
                          description: professionalProjectRequestVM.professionals[index].description
                                       
                        
                      );
                     }),
                   ),
             ),
             
             
            //  SizedBox(
            //   height:  SizeConfig.heightMultiplier * 1.2,
            //  ),
             SizedBox(
                height: professionalProjectRequestVM.professionals.isEmpty ? SizeConfig.heightMultiplier * 68.3: SizeConfig.heightMultiplier * 56.5,
                
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 20, top: 0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        // appText(text: 'Create or Select Project', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
                        // SizedBox(
                        //   height: 5,
                        // ),
                       
                        // // selectProjectTile(
                        // //   addButton: (){
                        // //     createProject(controller: professionalProjectRequestVM.addProjectController, professionalProjectRequestVM: professionalProjectRequestVM);
                        // //     },
                        // //   professionalProjectRequestVM: professionalProjectRequestVM
                        // // ) ,
                        // SizedBox(
                        //   height: 21,
                        // ),
                        // appText(text: 'Scope', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // selectScopeTile(professionalProjectRequestVM: professionalProjectRequestVM),
                       
                        appText(text: 'Message', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
                        SizedBox(
                          height: 5,
                        ),
                        formField(
                          title: '',
                          controller: professionalProjectRequestVM.messageController
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        appText(text: 'Select Your Desire Time', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(
                          ()=> datePickerTile(
                           onTap:  (){
                          professionalProjectRequestVM.showDatePicker(context);
                            },
                            date: DateFormat.yMMMMd().format(professionalProjectRequestVM.choosedDate.value).toString()
                          ),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            attechmentButton(
                              onTap: (){
                                professionalProjectRequestVM.getImage();
                              },
                              width: SizeConfig.widthMultiplier * 40,
                              icon: 'assets/cart/attach.png', text: 'Attach layout'),
                            SizedBox(width: 6,),
                            attechmentButton(
                              onTap: (){
                                professionalProjectRequestVM.getCameraImage();
                              },
                              width: SizeConfig.widthMultiplier * 40,
            
                              icon: 'assets/cart/Camera.png', text: 'Take Picture'),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        
                        ],
                      ),
                    ),
                 SizedBox(
                        height: 97,
                        child:  Obx(
                         ()=> ListView.builder(
                              padding: const EdgeInsets.only(left: 20,),
                              itemCount: professionalProjectRequestVM.newimagesList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                              return  professionalProjectRequestVM.newimagesList!.isNotEmpty ?   Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.black.withOpacity(0.6)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(image: FileImage(File(professionalProjectRequestVM.newimagesList![index].path)),fit: BoxFit.cover)
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 8.5),
                                    padding: EdgeInsets.all( 8),
                                    height: 97,
                                    width: 98,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                       
                                        Text( 
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              path.basename(professionalProjectRequestVM.newimagesList![index].path), 
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700
                                            ),),
                                            appText(text: professionalProjectRequestVM.getFileSizeString(bytes: professionalProjectRequestVM.newimagesList![index].path.length), textColor: AppColor.white, fontSize: 12, fontweight: FontWeight.w700)
                                                          
                                      ],
                                    ) 
                                  
                              ) : const SizedBox();
                            }),
                        ),
                        
                      ) ,
            
                      
                  ],
                ),
              ),
            
          ],
        )),
    );
  }

  
}