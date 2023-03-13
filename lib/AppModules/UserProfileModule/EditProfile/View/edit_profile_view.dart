import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/EditProfile/View/component/takepicture_bottomsheet.dart';
import 'package:hotlier/AppModules/UserProfileModule/EditProfile/View/component/text_formfield.dart';
import 'package:hotlier/AppModules/UserProfileModule/EditProfile/ViewModel/edit_profile_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';

class EditProfileView extends StatelessWidget {
 EditProfileView({super.key});
  final editProfileVM = Get.put(EditProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
                                          const SizedBox( width: 22,),

                                          appText(text: 'Edit Profile', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),     
                                ],
                              ),
            ),
           
           Expanded(
             child: Container(
                height: SizeConfig.heightMultiplier * 88.23,
                color: AppColor.white,
                child: Obx(
                  ()=> ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 38),
                     children: [
                     
                          
                       SizedBox(
                              height: SizeConfig.heightMultiplier * 18.8,
                              width: SizeConfig.widthMultiplier * 34.4,
                              child: Obx(
                                ()=> Stack(
                                                  alignment: Alignment.bottomCenter,
                                                  children: [
                                                    Positioned(
                                                      top: 0,
                                                      child: editProfileVM.image.isNotEmpty ? Container(
                                                        height: SizeConfig.heightMultiplier * 16.8,
                                                        width: SizeConfig.widthMultiplier * 34.4,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(image: FileImage(File(editProfileVM.image.value)), fit: BoxFit.cover)
                                                        ),
                                                      ) : Container(
                                                        height: SizeConfig.heightMultiplier * 16.8,
                                                        width: SizeConfig.widthMultiplier * 34.4,
                                                        decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          // image: DecorationImage(image: FileImage(File(editProfileVM.image.value)), fit: BoxFit.cover)
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        takePictureBottomSheet(
                                                          data: editProfileVM.editPorfileList,
                                                         fromCamera: editProfileVM.getImageFormCamera,
                                                         fromGallery: editProfileVM.getImageFormStorage,
                                                         delete: editProfileVM.deleteImage
                                                        );
                                                       
                                              
                                                      },
                                                      child: Image(
                                                        image:const AssetImage('assets/profile/camera.png'), height: SizeConfig.heightMultiplier * 4.3,)
                                                      )
                                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 3,
                            ),
                      editProfileFormField(controller: editProfileVM.nameController, title: 'John',readOnly: editProfileVM.readOnly1.value,
                      onTap: (){
                        editProfileVM.readOnly1.value = !editProfileVM.readOnly1.value;
                      }
                      ),
                    const  SizedBox(
                        height: 21,
                      ),
                      editProfileFormField(controller: editProfileVM.emailController, title: 'josephren@mail.com',
                      
                       readOnly: editProfileVM.readOnly2.value,
                       onTap: (){
                        editProfileVM.readOnly2.value = !editProfileVM.readOnly2.value;
                        
                       }
                       ),
                      const SizedBox(
                        height: 21,
                      ),
                      editProfileFormField(controller: editProfileVM.bussinessController, title: 'Bussiness type',readOnly: editProfileVM.readOnly3.value,
                      onTap: (){
                      editProfileVM.readOnly3.value = !editProfileVM.readOnly3.value;
                  
                      }),
                       const SizedBox(
                        height: 21,
                      ),
                      editProfileFormField(controller: editProfileVM.addressController, title: 'Address', maxLine: null,readOnly: editProfileVM.readOnly4.value,
                      onTap: (){
                      editProfileVM.readOnly4.value = !editProfileVM.readOnly4.value;
                  
                      }),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 10,
                      ),
                      appButton(onTap: (){}, widget:appText(text: 'Save', fontSize: 16,textAlign: TextAlign.center, fontweight: FontWeight.w700), buttonColor: AppColor.cyan, width: SizeConfig.widthMultiplier * 100, height: SizeConfig.heightMultiplier * 8, radius: 14)
                     ],
                  ),
                ),
              ),
           )
          ],
        )
      ),
    );
  }
}