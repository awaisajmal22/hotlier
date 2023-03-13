import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/FavoriteModule/ViewModel/favorite_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../common/app_Text.dart';
import '../../../common/app_button.dart';
import '../../../common/app_color.dart';
import 'component/favorite_brands_tile.dart';
import 'component/favorite_designer_tile.dart';
import 'component/favorite_product_tile.dart';

class FavoriteView extends StatelessWidget {
   FavoriteView({super.key, required this.check});
   final favoriteVM = Get.put(FavoriteViewModel());
  bool? check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                      check == false? const SizedBox(width: 45,) : appButton(
                                            onTap: (){
                                             Navigator.of(context).pop();
                                            }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                            buttonColor: AppColor.white),
                                            const SizedBox( width: 22,),
      
                                            appText(text: 'Favorites', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),     
                                  ],
                                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1,
              ),
              SizedBox(
                height:check == false ? SizeConfig.heightMultiplier * 82.25 : SizeConfig.heightMultiplier * 80.25,
                child: ListView(
                  padding: const EdgeInsets.only(top: 50),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: appText(text: 'Favorites product'.toUpperCase(), fontSize: 12, fontweight: FontWeight.w700, textColor: const Color(0xff171717).withOpacity(0.4)),
                    ),const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 210,
                      child: Obx(
                        ()=> ListView.builder(
                          itemCount: favoriteVM.favoriteproductList.length,
                          padding: const EdgeInsets.symmetric(horizontal: 15.5),
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                          return favoriteProductTile(
                                
                                imageUrl: favoriteVM.favoriteproductList[index].imageUrl,
                                title: favoriteVM.favoriteproductList[index].name,
                                price: favoriteVM.favoriteproductList[index].price
                              
                          );
                          
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: appText(text: 'Favorites Designer’s'.toUpperCase(), fontSize: 12, fontweight: FontWeight.w700, textColor: const Color(0xff171717).withOpacity(0.4)),
                    ),const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 210,
                      child: ListView.builder(
                        itemCount: 6,
                        padding: const EdgeInsets.symmetric(horizontal: 15.5),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                        return favoriteDesignerTile(
                          imageUrl: 'https://cdn.pixabay.com/photo/2023/01/23/15/02/beaver-rat-7738914__340.jpg',
                          title: 'Sara',
                          subtitle: 'Visual Designer'
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: appText(text: 'Favorites Brands'.toUpperCase(), fontSize: 12, fontweight: FontWeight.w700, textColor: const Color(0xff171717).withOpacity(0.4)),
                    ),
                    const SizedBox(
                      height:  18,
                    ),
                     SizedBox(
                      height: 181,
                      child: ListView.builder(
                      
                        itemCount: 6,
                        padding: check== true ? const EdgeInsets.only(left: 15.5, right: 15.5, bottom: 10) :  const EdgeInsets.symmetric(horizontal: 15.5),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                        return favoriteBrandsTile(
                          imageUrl: 'https://cdn.pixabay.com/photo/2023/01/23/15/02/beaver-rat-7738914__340.jpg',
                          title: 'Sara',
                          subtitle: 'Visual Designer'
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 5,
                    )

                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  
}