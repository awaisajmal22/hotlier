import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/signup/Services/signup_services.dart';
import 'package:hotlier/AppModules/BrandsModule/View/BrandsView/brands_view.dart';
import 'package:hotlier/AppModules/CategoryModule/View/category_view.dart';
import 'package:hotlier/AppModules/ExploreModule/View/Explore2View/explore_2_view.dart';
import 'package:hotlier/AppModules/HomeModule/Services/home_services.dart';
import 'package:hotlier/AppModules/HomeModule/ViewModel/home_view_model.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist1/View/setupArtist1_view.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist2/View/SetupArtist2_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../ExploreModule/View/Explore1View/explore_view.dart';
import 'component/carousel_tile.dart';
import 'component/explore_tile.dart';
import 'component/product_tile.dart';

class HomeView extends StatelessWidget {

//  HomeView({super.key});
 final homeVM = Get.put(HomeViewModel());
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 2,
          ),
          CarousalTile(),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3.5,
          ),
          Container(
            height: SizeConfig.heightMultiplier * 51.36594,
           
            color: AppColor.white,
            child: ListView(
              children: [
               exploreTile(
                 title: 'Explore Products',
                seeAllButton:  (){
                 Navigator.push(
                  context,
                 MaterialPageRoute(
                  builder: (context) =>  CategoryView(
                      categoryList: homeVM.productList,
                      buttonIndex: homeVM.productListIndex,
                      onTapFunction: (){
                        
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ExploreView2()));
                  // print(buttonIndex);
                }
                      
                    ),
                  ));
                }
               ),
        Container(
                    margin: EdgeInsets.symmetric(vertical: 31),
                    height: 93,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeVM.productList.length,
                      itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          radius: 14,
                          onTap: (){
                           homeVM.productListIndex.value = index;
                          //  print(buttonIndex);
                          },
                          child:  Obx(()=> listViewTile(homeVM.productListIndex.value, index, homeVM.productList)),
                          ),
                      
                      );
                    }),
                  ),
                Container(
                  height: 2, width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.buttonColor,
                ),
                SizedBox(
                  height: 30,
                ),
                exploreTile(title: 'Explore Professionals', seeAllButton: (){

                  
                   Navigator.push(
                  context,
                 MaterialPageRoute(
                  builder: (context) =>  CategoryView(categoryList: homeVM.professionalsList, buttonIndex: homeVM.professionalListIndex,
                  onTapFunction: (){
 Navigator.push(context, MaterialPageRoute(
  builder: (context)=> SetupArtist1View()));
                  },
                  )));

                }),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 31),
                    height: 110,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeVM.professionalsList.length,
                      itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          radius: 14,
                          onTap: (){
                           homeVM.professionalListIndex.value = index;
                          //  print(buttonIndex);
                          },
                          child:  Obx(()=> listViewTile(homeVM.professionalListIndex.value, index, homeVM.professionalsList)),
                          ),
                      
                      );
                    }),
                  ),
                   Container(
                  height: 2, width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.buttonColor,
                ),
                SizedBox(
                  height: 30,
                ),
                exploreTile(title: 'Explore Brands', seeAllButton: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BrandsView()));
                }), 
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 21),
                  height: 181,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),

                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                  color: Color(0xffEDF0F2),

                          borderRadius: BorderRadius.circular(10)),

                        margin: EdgeInsets.only(right: 10),
                        height: 181,
                        width: 136,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           
                           CircleAvatar(
                            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg",),
                            radius: 50,
                            ), SizedBox(
                              height: 4,
                            ),
                            appText(text: 'Ashley', textColor: Color(0xff171717),textAlign: TextAlign.center, fontSize: 14, fontweight: FontWeight.w500),
                            SizedBox(
                              height: 5,
                            ),
                            appText(text: 'Homestore', textColor: Color(0xff171717).withOpacity(0.6),textAlign: TextAlign.center, fontSize: 12, fontweight: FontWeight.w400),

                          ],
                        ),
                      );
                  }),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

 
  

  
}