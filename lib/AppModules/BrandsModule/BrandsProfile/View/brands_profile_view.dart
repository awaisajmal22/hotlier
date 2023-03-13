import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/BrandsModule/BrandsProfile/View/component/brand_description_tile.dart';
import 'package:hotlier/AppModules/BrandsModule/BrandsProfile/View/component/staggered_brand-tile.dart';
import 'package:hotlier/AppModules/BrandsModule/BrandsProfile/ViewModel/brands_profile_view_model.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import 'component/address_tile.dart';
import 'component/brands_product_tile.dart';

class BrandsProfileView extends StatelessWidget {
 BrandsProfileView({super.key});
  final brandsProfileVM = Get.put(BrandsProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           Container(
            color: AppColor.transparent,
            height: SizeConfig.heightMultiplier * 30,
            width: SizeConfig.widthMultiplier * 100,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 9,),
                    alignment: Alignment.topLeft,
                  
                            width: SizeConfig.widthMultiplier * 100,
                    height: SizeConfig.heightMultiplier * 30,
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 appButton(
                                        onTap: (){
                                         Navigator.of(context).pop();
                                        }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                        buttonColor: AppColor.white),
                                        const SizedBox( width: 22,),
  
                              ],
                            ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: addressTile(
                    name: 'John',
                    businesstitle: 'HomeStore',
                    location: '43 Oxford Road, M13 4GR Manchester, UK'
                  )
                ),
                 Positioned(
                  top: SizeConfig.heightMultiplier * 4,
                   child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 6,
                          blurRadius: 20,
                          color: AppColor.black.withOpacity(0.06),
                          offset: const Offset(0,4),
                        )
                      ],
                      image: const DecorationImage(image: NetworkImage('https://images.pexels.com/photos/7505201/pexels-photo-7505201.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'), fit: BoxFit.cover)
                    ),
                      height: SizeConfig.heightMultiplier * 12.5,
                      width: SizeConfig.widthMultiplier * 25.5,
                    ),
                 ),
                
              ],
            )
          ),
         Expanded(
           child: ListView(
            padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2.7, bottom: 10),
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 35),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(text: 'Description', fontSize: 15, fontweight: FontWeight.w400, textColor: AppColor.darkgrey),
                 brandDescriptionTile(brandsProfileVM: brandsProfileVM, lessText: 'This armchair is an elegant and functional piece of furniture. ', moreText: 'This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.'),
                 const SizedBox(
                  height: 12.22,
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(text: 'Explore products', textColor: AppColor.textBlack, fontSize: 16, fontweight: FontWeight.w700),
                    GestureDetector(
                      onTap: (){
               
                      },
                      child: appText(text: 'See All', textColor: AppColor.cyan, fontSize: 13, fontweight: FontWeight.w700)),
                  ],
                 ),
                  ],
                 ),
               ),
               const SizedBox(
            height: 9,
           ),
           SizedBox(
            height: 104,
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            padding: const EdgeInsets.only(left: 31),
            itemBuilder: (context, index){
            return brandsProductTile(
              imageUrl: 'https://cdn.pixabay.com/photo/2023/01/30/23/09/bird-7756768__340.jpg',
              productName: 'Computer Table'
            );
            }),
           ),
           const SizedBox(
            height: 20,
           ),
           Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            height: SizeConfig.heightMultiplier * 26,
            child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              staggeredBrandTile(),
              appButton(onTap: (){}, widget: appText(text: 'Request For Proposal'), width: SizeConfig.widthMultiplier * 100,height: 60, buttonColor: AppColor.cyan)
            ],
            ),
           )
         
            ],
           ),
         ),
         
          ],
        )
      ),
    );
  }

 
  
}