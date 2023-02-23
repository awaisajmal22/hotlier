import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/attchment_button.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/create_project.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/date_picker_tile.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/formField.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/component/scope_tile.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/SelectProfessionalView/select_professional_view.dart';
import 'package:hotlier/AppModules/CartRequestModule/ViewModel/cart_request_view_model.dart';
import 'package:hotlier/common/size_config.dart';
import 'package:intl/intl.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import 'component/select_project_tile.dart';
import 'package:path/path.dart' as path;


class CartRequestView extends StatelessWidget {
   CartRequestView({super.key, required this.projectName});
  final cartrequestVM = Get.put(CartRequestViewModel());
  String projectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appText(text: 'To:', textColor: AppColor.textBlack.withOpacity(0.6),fontSize: 14, fontweight: FontWeight.w400),
                  // Row(
                  //   children: [
                  // appText(text: 'Add', textColor: AppColor.textBlack.withOpacity(0.6),fontSize: 14, fontweight: FontWeight.w400),
                  // SizedBox(
                  //   width: 6,
                  // ),
                  // GestureDetector(
                  //   onTap: (){
                  //     print(cartrequestVM.professionals.length);
                  //     Get.to(SelectProfessionalView(
                  //     ));
                  //   },
                  //   child: ImageIcon(AssetImage('assets/cart/plus.png'), size: 20, color: AppColor.cyan,),
                  // )
                  

                  //   ],
                  // )
                  
                ],
              ),
            ),
            // SizedBox(
            //   height: SizeConfig.heightMultiplier * 2.5,
            // ),

            //  Obx(
            //    ()=> SizedBox(
            //     height: cartrequestVM.professionals.length <= 0 ? 0 : SizeConfig.heightMultiplier * 12,
            //      child: ListView.builder(
            //         itemCount: cartrequestVM.professionals.length,
            //         padding: EdgeInsets.symmetric(horizontal: 10),
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index){
            //         return selectProfessionalsTile(
            //           width: SizeConfig.widthMultiplier * 80,
            //           url: cartrequestVM.professionals[index].imageUrl,
            //           name: cartrequestVM.professionals[index].name,
            //           description: cartrequestVM.professionals[index].description
                                   
            //         );
            //        }),
            //      ),
            //  ),
             Container(
              alignment: Alignment.center,
              // color: AppColor.cyan,
              height: SizeConfig.heightMultiplier * 10,
              child:  ListTile(
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(text: 'Jack Rayne', fontSize: 20, fontweight: FontWeight.w700, textColor: AppColor.cyan,),
               appText(text: 'By Duhome Elegant Lifestyle', fontSize: 15, fontweight: FontWeight.w500, textColor: AppColor.textBlack),
               appText(text: projectName, fontSize: 15, fontweight: FontWeight.w500, textColor: AppColor.lightgrey),

                  ],
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?size=626&ext=jpg&ga=GA1.2.1895302013.1677047464'),
                ),
                
              ),
             ),
             
             SizedBox(
              height:  SizeConfig.heightMultiplier * 1.2,
             ),
            // Obx(
            //   ()=>
            SizedBox(
                height:  SizeConfig.heightMultiplier * 61,
                
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 20),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
            //             appText(text: 'Create or Select Project', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
            //             SizedBox(
            //               height: 5,
            //             ),
                       
            //             selectProjectTile(
            //               addButton: (){
            //                 createProject(controller: cartrequestVM.addProjectController, cartrequestVM: cartrequestVM);
            //                 },
            //               cartrequestVM: cartrequestVM
            //             ) ,
            //             SizedBox(
            //               height: 21,
            //             ),
                        appText(text: 'Scope', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
                        SizedBox(
                          height: 5,
                        ),
                        selectScopeTile(cartrequestVM: cartrequestVM),
                        SizedBox(
                          height: 21,
                        ),
                        appText(text: 'Message', textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 14, fontweight: FontWeight.w400),
                        SizedBox(
                          height: 5,
                        ),
                        formField(
                          title: '',
                          controller: cartrequestVM.messageController
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
                          cartrequestVM.showDatePicker(context);
                            },
                            date: DateFormat.yMMMMd().format(cartrequestVM.choosedDate.value).toString()
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
                                cartrequestVM.getImage();
                                cartrequestVM.cameracheck.value = false;
                              },
                              width: SizeConfig.widthMultiplier * 40,
                              icon: 'assets/cart/attach.png', text: 'Attach layout'),
                            SizedBox(width: 6,),
                            attechmentButton(
                              onTap: (){
                                print(cartrequestVM.newimagesList!.length);
                                cartrequestVM.cameracheck.value = true;
                                cartrequestVM.getCameraImage();
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
                        child: Obx(
                          ()=> ListView.builder(
                            padding: EdgeInsets.only(left: 20,),
                            itemCount: cartrequestVM.newimagesList!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                            return cartrequestVM.newimagesList!.isNotEmpty ? Container(
                                  alignment: Alignment.center,
                                  
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.black.withOpacity(0.6)
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: FileImage(File(cartrequestVM.newimagesList![index].path)),fit: BoxFit.cover) 
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 8.5),
                                  padding: EdgeInsets.all(8),
                                  height: 97,
                                  width: 98,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      
                                      
                                      Text( 
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        path.basename(cartrequestVM.newimagesList![index].path), 
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700
                                      ),),
                                      appText(text: cartrequestVM.getFileSizeString(bytes: cartrequestVM.newimagesList![index].path.length), textColor: AppColor.white, fontSize: 12, fontweight: FontWeight.w700)
                                                    
                                    ],
                                  ) 
                                
                            ) : const SizedBox();
                          }),
                        ),
                      ),
            
                      
                  ],
                ),
              ),
            // )
          ],
        )),
    );
  }

  
}