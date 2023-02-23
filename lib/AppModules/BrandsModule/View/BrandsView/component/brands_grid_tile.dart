import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/BrandsModule/View/BrandsProfileView/brands_profile_view.dart';
import 'package:hotlier/AppModules/BrandsModule/ViewModel/brands_viewmodel.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../../../../common/size_config.dart';

Widget brandsGridTile(BuildContext context, {required BrandsViewModel brandsVM, required String title, required String subtitle, required String imageUrl}) {
    return Obx(
      ()=> Container(
        margin: EdgeInsets.symmetric( horizontal:  5,),
    height: SizeConfig.heightMultiplier * 65,
    child: brandsVM.check.value == false ?  GridView.builder(
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
                        MaterialPageRoute(builder: (context) =>  BrandsProfileView()));
                              
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  // border: Border.all(color: Color(0xff940D5A)),
                                  color: AppColor.buttonColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                     backgroundImage:  NetworkImage(
                                              imageUrl,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 19,
                                          ),
                                    appText(
                                      fontSize: 12,
                                      fontweight: FontWeight.w500,
                                      text: title,
                                      textColor: AppColor.textBlack
                                    ),
                                    appText(
                                      fontSize: 12,
                                      fontweight: FontWeight.w400,
                                      text: subtitle,
                                      textColor: AppColor.textBlack.withOpacity(0.6)
                                    ),
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
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)
                                        ),
                                        image: DecorationImage(image:NetworkImage(imageUrl), fit: BoxFit.cover)
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 53.45),
                                      alignment: Alignment.centerLeft,
                                      height: 88,
                                      width: SizeConfig.widthMultiplier * 62,
                                      decoration: BoxDecoration(
                                        color: AppColor.buttonColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                        ),
                                        
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          appText(text: title, textColor: AppColor.textBlack, fontSize: 12, fontweight: FontWeight.w500),
                                          appText(text: subtitle, textColor: AppColor.textBlack.withOpacity(0.6), fontSize: 12, fontweight: FontWeight.w400),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
    )
      ),
    );
  }