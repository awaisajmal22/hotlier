

// import 'package:country_code_picker/country_code_picker.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/signup/Services/signup_services.dart';
import 'package:hotlier/AppModules/AuthModule/phone/Services/verification_services.dart';
import 'package:hotlier/AppModules/AuthModule/phone/View/component/dailog_box.dart';
import 'package:hotlier/AppModules/AuthModule/signup/ViewModel/signup_view_model.dart';
import 'package:hotlier/AppModules/BottomNavBarModule/presistent_tab_items.dart';
import 'package:hotlier/common/TextField/text_field.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/loadingIndicator.dart';
import 'package:hotlier/common/size_config.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../common/app_button.dart';
import 'component/phone_text_formfield.dart';

class PhoneView extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final verificationVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 9),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 appButton(onTap: (){
                    Get.back();
                  }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                  buttonColor: AppColor.white),
                  
                  
              ],
            ),
            const SizedBox(
                    height: 56,
                  ),
           appText(text: 'Enter Your Phone\nNumber', textColor: AppColor.darkgrey, fontSize: 38, fontweight: FontWeight.w700),
            SizedBox(
              // height: 49.9,
              height: SizeConfig.heightMultiplier * 5.49,
            ),
            // phoneTextFormField(
            //   onChanged: (phone){
               
            // verificationVM.userCountryCode.value = phone!.countryCode;
            //   },
              
            //   keyboardType: TextInputType.number,
            //   hintText: 'Phone Number',
            
            //   controller: verificationVM.phoneController,
              
            //   context: context,
            //   prefixicon: null
            // //   // prefixicon: CountryCodePicker(
            // //   //       onChanged: verificationVM.onChange,
            // //   //       showFlagDialog: true,
            // //   //       showFlag: true,
            // //   //       textStyle: TextStyle(
            // //   //         color: AppColor.lightgrey
            // //   //       ),
            // //   //       initialSelection: verificationVM.userCountryCode.value,
            // //   //       favorite: ['+92', 'PK'],
                    
            // //   //       alignLeft: false,
            // //   //     ),
            // ),
           Obx(
             ()=> phoneTextFormField(
                                  
                                  validation: (value){
                                    if(value!.isEmpty){
                                      return "Please Enter Your Phone Number";
           
                                    } else if(verificationVM.phoneController.text.length < 7){
                                      return "Please Enter Valid Phone Number";
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                countryCode: verificationVM.userCountryCode.value,
                                  context: context, 
                                  onSelect: (value){
                                   verificationVM.userCountryCode.value = value!.phoneCode;
                                  },
                                                           //  onChanged: (phone){
                                                           //   forgetPasswordVM.countryCode.value = phone!.countryCode;
                                                           //   print(forgetPasswordVM.countryCode.value);
                                                           //  }, 
                                 controller: verificationVM.phoneController, 
                                 hintText: 'Enter Phone Number', 
                                 ),
           ),
                             
                             
            
            SizedBox(
              // height: 24.29,
              height: SizeConfig.heightMultiplier * 5.49,

            ),
            appButton(
              onTap: () async {
            
            if(_formKey.currentState!.validate()){
              showLoadingIndicator(context: context);
              String? data = await verificationVM.onSignUp();
              // ignore: use_build_context_synchronously
              hideOpenDialog(context: context);
              // if(data == 'success'){
                print('data $data');
             // ignore: use_build_context_synchronously
             showGeneralDialog(
              barrierColor: AppColor.white.withOpacity(0.02),
              context: context,
               pageBuilder: (context, animation, secondaryAnimation) {
               return  BackdropFilter(
                                     filter: ImageFilter.blur(
                                          sigmaX: 1.8,sigmaY: 1.8
                                        ),
                                    child:  Obx(
                                      ()=> customDailog(
                                      
                                        time: verificationVM.time.value,
                                        title: 'Phone Number',
                                        subtitle: '+${verificationVM.userCountryCode.value} ${verificationVM.phoneController.text}',
                                      ),
                                    ) 
                                  );
             },
              );
            verificationVM.startTimer(240);
              print(verificationVM.time.value);
            }
            },
              // },
            
           
          widget: appText(
            text: 'Verification'
            ,textAlign: TextAlign.center, 
            fontSize: 16, fontweight: 
            FontWeight.w600), 
            width: SizeConfig.widthMultiplier * 100,
            height: 65.52,
             buttonColor: AppColor.cyan,
             radius: 14
             ),
             SizedBox(
              height: SizeConfig.heightMultiplier * 1.13,
             ),
             appButton(
              onTap: (){
            if(_formKey.currentState!.validate()){
              print('success');
            }
            else {
              print('Error');
            }
          }, 
          widget: appText(
            text: 'Later',
            textColor: AppColor.cyan,
            textAlign: TextAlign.center, 
            fontSize: 16, fontweight: 
            FontWeight.w600), 
            width: SizeConfig.widthMultiplier * 100,
            height: 65.52,
             buttonColor: AppColor.lightCyan,
             radius: 14
             ),
          ],
              ),
        )),
    );
  }
}