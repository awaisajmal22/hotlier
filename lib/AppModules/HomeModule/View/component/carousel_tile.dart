import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/Notification/View/notification_view.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../../ViewModel/home_view_model.dart';

class CarousalTile extends StatelessWidget {
  CarousalTile({super.key, required this.name});
final homeVM = Get.put(HomeViewModel());
String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
          height: SizeConfig.heightMultiplier * 30,
          width: SizeConfig.widthMultiplier * 100,
          child: Column(
            children: [
            Container(
              padding: const EdgeInsets.only(left: 36, right: 44.57),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(text: 'Hi, $name', fontSize: 24, fontweight:  FontWeight.w700, textColor: AppColor.darkgrey),
                      appButton(onTap: (){
                        Get.to(NotificationView());
                      }, 
                      widget: const ImageIcon(AssetImage('assets/home/bell.png')))
                    ],

                  ),
                      appText(text: 'Design your Dream Home With Us', fontSize: 14, fontweight:  FontWeight.w400, textColor: AppColor.darkgrey),

                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 20,
              child: PageView.builder(
                pageSnapping: true,
                allowImplicitScrolling: true,
                controller: homeVM.controller,
                onPageChanged: (value){
                  homeVM.carouselIndex.value = value;
                },
                itemCount: homeVM.images.length,
                itemBuilder: (context, index) {
               
                return Obx(
                  ()=> AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutCubic,
                    
                              margin: homeVM.carouselIndex == index ?  EdgeInsets.symmetric(horizontal:  20) : EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage(homeVM.images[index]), fit: BoxFit.cover)
                    ),
                  ),
                );
              },),
            ), const SizedBox(
              height: 12,
            ), 
            
               Obx(
                 ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(homeVM.images.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(seconds: 1),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: homeVM.carouselIndex.value == index ? AppColor.cyan : AppColor.lightCyan
                    ),
                               );
               }),
                               ),
               ),
               
            
          ]),
         );;
  }
}