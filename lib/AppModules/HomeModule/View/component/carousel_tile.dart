import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/View/Notification/notification_view.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../../ViewModel/home_view_model.dart';

class CarousalTile extends StatelessWidget {
  CarousalTile({super.key});
final homeVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
          height: SizeConfig.heightMultiplier * 30,
          width: SizeConfig.widthMultiplier * 100,
          child: Column(
            children: [
            Container(
              padding: EdgeInsets.only(left: 36, right: 44.57),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(text: 'Hai, John', fontSize: 24, fontweight:  FontWeight.w700, textColor: AppColor.darkgrey),
                      appButton(onTap: (){
                        Get.to(NotificationView());
                      }, 
                      widget: ImageIcon(AssetImage('assets/home/bell.png')))
                    ],

                  ),
                      appText(text: 'Design your Dream Home With Us', fontSize: 14, fontweight:  FontWeight.w400, textColor: AppColor.darkgrey),

                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 20,
              child: PageView.builder(
                controller: homeVM.controller,
                onPageChanged: homeVM.carouselIndex,
                itemCount: homeVM.images.length,
                itemBuilder: (context, index) {
                
                return Container(
                  
              margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage(homeVM.images[index]), fit: BoxFit.cover)
                  ),
                );
              },),
            ), SizedBox(
              height: 12,
            ), 
            
               Obx(
                 ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(homeVM.images.length, (index) {
                      return Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
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