import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/View/login/login_view.dart';

class OnBoardingViewModel extends GetxController{
  RxList<dynamic> onboardingImage = [
    OnBoardingModel(url:'assets/onboarding/onboarding1.png', 
    description: "A unified platform to connect Hoteliers and Procurement Professionals to Interior Designer, Consultants, Specifiers, Manufacturers and Suppliers", 
    title: 'A unified platform to connect Hoteliers and Procurement Professionals to Interior Designer, Consultants, Specifiers, Manufacturers and Suppliers'),
    OnBoardingModel(url:     'assets/onboarding/onboarding2.png',
 title: 'Furnish Hotel, Restaurants and Cafes with professional interior designer, specifiers and manufacturers',
     description:    '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu tristique tristique quam in.“'
        ),
OnBoardingModel(
  url: 'assets/onboarding/onboarding3.png',
 title:'Manage procurement of furnishing and operational supplies',
description: '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu tristique tristique quam in.“'
 )  
 ].obs;
  final controller = PageController();

 RxInt selectedPage = 0.obs;
 bool get isLastPage => selectedPage == onboardingImage.length - 1;
 getToNextPage(){
if(isLastPage){
  Get.offAll(LoginView());
}
else {
controller.nextPage(duration:Duration(milliseconds: 300), curve: Curves.easeIn);
}
 }
}

class OnBoardingModel{
  String url;
  String title;
  String description;
  OnBoardingModel({
    required this.url,required this.description,
    required this.title
  });
}