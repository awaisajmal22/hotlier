import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/ExploreModule/View/Explore2View/component/explore2_grid_tile.dart';
import 'package:hotlier/AppModules/ExploreModule/View/Explore2View/component/filter_bottom_sheet.dart';
import 'package:hotlier/AppModules/ExploreModule/ViewModel/explore_view_model.dart';
import 'package:hotlier/AppModules/FavoriteModule/ViewModel/favorite_view_model.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import '../Explore1View/component/search_tile.dart';
import 'component/explore2Listview.dart';

class ExploreView2 extends StatelessWidget {
  ExploreView2({super.key});
  final exploreVM = Get.put(ExploreViewModel());
  final favoriteVM = Get.put(FavoriteViewModel());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
              physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      appButton(
                          onTap: (){
                            // print(backButtonCheck);
                           Navigator.of(context).pop();
                          }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                          buttonColor: AppColor.white),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  children: [
                    Row(
    
                      children: [
                        searchTile(
                          context,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              filterBottomSheet(
                                material: exploreVM.material,
                                selectedMaterial: exploreVM.selectedMaterial,
                                colors: exploreVM.colors,
                                selectedColor: exploreVM.selectedColor
                                );
                            },
                            child: const Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                              child: const FaIcon(FontAwesomeIcons.sliders, color: AppColor.darkgrey,),
                            ),
                          ),
                          controller: null ),
                        SizedBox(
                          width: 7,
                        ),
                       Obx(
                         ()=> GestureDetector(
                              onTap: (){
                                exploreVM.check.value = !exploreVM.check.value;
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                alignment: Alignment.center,
                                height: 51,
                                width: 51,
                                decoration: BoxDecoration(
                                  color: AppColor.buttonColor,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: exploreVM.check.value ? Image.asset('assets/explore/card.png') : FaIcon(FontAwesomeIcons.list, color: AppColor.darkgrey,),
                              ),
                            ),
                       ),
      
      
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
               Obx(
                ()=> SizedBox(
                  width: SizeConfig.widthMultiplier * 100,
                  height: SizeConfig.heightMultiplier * 70,
                  // color: AppColor.cyan,
                  child: exploreVM.check.value == false ? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       
                       crossAxisSpacing: 10,
                       mainAxisSpacing: 14,
                       childAspectRatio: 6/6.5,
                       crossAxisCount: 2), 
                       itemCount: exploreVM.prdocutList.length,
                    itemBuilder: (context, index){
                      return   Obx(
                        ()=> explore2GridTile(
                            check: exploreVM.prdocutList[index].check.value,
                            imageUrl: exploreVM.prdocutList[index].imageUrl,
                            price: exploreVM.prdocutList[index].price,
                            title: exploreVM.prdocutList[index].name,
                            addFavorite: (){
                               FocusManager.instance.primaryFocus!.unfocus();
                              exploreVM.prdocutList[index].check.value = !exploreVM.prdocutList[index].check.value;
                              if(exploreVM.prdocutList[index].check.value == true){
                              
                              favoriteVM.favoriteproductList.add(exploreVM.prdocutList[index]);
                              }
                              else {
                                favoriteVM.favoriteproductList.remove(exploreVM.prdocutList[index]);
                   
                   
                              }
                            }
                          
                        ),
                      );
                    }) :  ListView.builder(
                        itemCount: exploreVM.prdocutList.length,
                        itemBuilder: (context, index){
                        return explore2ListViewTile(
                         imageUrl: exploreVM.prdocutList[index].imageUrl,
                            price: exploreVM.prdocutList[index].price,
                            title: exploreVM.prdocutList[index].name
                        );
                      })
                    ),
               )
            
            ],
          )
          ),
            ]
      )
        )
      ),
    );
  }
}
