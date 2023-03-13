import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/ExploreModule/View/Explore2/explore_2_view.dart';
import 'package:hotlier/AppModules/ExploreModule/ViewModel/explore_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';


Widget gridViewTile(BuildContext context, {required ExploreViewModel exploreVM, required bool backButtonCheck}) {
    return Obx(
      ()=> Container(
        
        margin: const EdgeInsets.symmetric( horizontal:  5,),
    height: backButtonCheck == false ? SizeConfig.heightMultiplier * 70.55 : SizeConfig.heightMultiplier * 64.94,
    child: exploreVM.check.value == false ?  GridView.builder(
      padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 10,
                                childAspectRatio: 7/9,
                                  crossAxisCount: 2
                                  ),
                                 
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                 Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  ExploreView2()));
                                // Get.to(() => SearchResultsView2());
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  // border: Border.all(color: Color(0xff940D5A)),
                                  color: AppColor.buttonColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: SizeConfig.heightMultiplier * 22,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          // border: Border.all(color: Color(0xff940D5A)),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/explore/image.png',
                                            ),
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10,right: 10, bottom: 5),
                                     
                                        alignment: Alignment.centerLeft,
                                        height: SizeConfig.heightMultiplier * 4.5,
                                        width: double.infinity,
                                        child: appText(
                                          fontSize: 15,
                                          fontweight: FontWeight.w400,
                                          text: 'Chair',
                                          textColor: AppColor.textBlack
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }) : ListView.builder(
                          
                            itemCount: 8,
                            itemBuilder: (context,index){
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 88,
                                      width: SizeConfig.widthMultiplier * 25,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)
                                        ),
                                        image: DecorationImage(image: AssetImage('assets/explore/image.png'), fit: BoxFit.cover)
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 53.45),
                                      alignment: Alignment.centerLeft,
                                      height: 88,
                                      width: SizeConfig.widthMultiplier * 62,
                                      decoration: const BoxDecoration(
                                        color: AppColor.buttonColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                        ),
                                        
                                      ),
                                      child: appText(text: 'Chair', textColor: AppColor.textBlack, fontSize: 20, fontweight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
    )
      ),
    );
  }