import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/View/login/login_view.dart';
import 'package:hotlier/AppModules/OnBoardingModule/ViewModel/onBoarding_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../common/app_button.dart';

class OnBoardingView extends StatelessWidget {
   OnBoardingView({super.key});
  final onBoardingController = Get.put(OnBoardingViewModel());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              controller: onBoardingController.controller,
              onPageChanged: onBoardingController.selectedPage,
              scrollDirection: Axis.horizontal,
              itemCount: onBoardingController.onboardingImage.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(onBoardingController.onboardingImage[index].url),fit: BoxFit.cover,),
                  ),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                       Positioned(
                    bottom: -10,
                    left: -10,
                    right: -10,
                    child: Image(image: AssetImage('assets/onboarding/overlay.png'),fit: BoxFit.cover)),
                    Positioned(
                      bottom: SizeConfig.heightMultiplier * 8,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: SizeConfig.heightMultiplier * 30,
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            appText(text: onBoardingController.onboardingImage[index].title, textAlign: TextAlign.justify),
                            SizedBox(
                              height: 20,
                            ),
                            
                            
                        
                          ],
                        ),
                      ),
                    )
                    ],
                  ),
                );
              }),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:  SizeConfig.widthMultiplier * 5, vertical: SizeConfig.heightMultiplier * 3),
                      child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                               GestureDetector(
                                    onTap: (){
                          Get.offAll(LoginView());
                                    },
                                    child: appText(text: 'Skip'.toUpperCase(), fontSize: 18, 
                                    fontweight: FontWeight.w400)),
                                
                                Obx(
                                  ()=> Row(
                                    children: List.generate(3, (ind) =>  Container(
                                                        margin:  EdgeInsets.symmetric( horizontal: 3.56),
                                      height: 8.74,
                                      width: onBoardingController.selectedPage.value == ind ? 16.85 : 8.99,
                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                        color: onBoardingController.selectedPage.value == ind ? AppColor.darkgrey : AppColor.white
                                      ),
                                                          ),
                                    )),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    onBoardingController.getToNextPage();
                                  },
                                 child: appText(text: 'Next'.toUpperCase(), 
                                  fontSize: 18, fontweight: FontWeight.w400
                                  )),
                             
                                ],
                              ),
                    ),
                  
              
                  ],
                
              
            
      
      ),
      
    );
  }
}