import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/description_tile.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist2/View/component/description_tile.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist2/View/component/richtext_tile.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist2/View/component/staggeredTile.dart';
import 'package:hotlier/AppModules/SetupArtistModule/VIewModel/setupArtist2_view_model.dart';
import 'package:hotlier/AppModules/UserProfileModule/View/Profile/CreateOrSelectProject/create_or_select_project_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';

class SetupArtis2View extends StatelessWidget {
   SetupArtis2View({super.key,});
  final setupArtist2VM = Get.put(SetupArtist2ViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          SizedBox(
              height: SizeConfig.heightMultiplier * 25,
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
                      height: SizeConfig.heightMultiplier * 25,
                      child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   appButton(
                                          onTap: (){
                                           Navigator.of(context).pop();
                                          }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                          buttonColor: AppColor.white),
                                          SizedBox( width: 22,),
      
                                ],
                              ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.heightMultiplier * 15,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.cyan,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: -1,
                        blurRadius: 22,
                        offset: Offset(0, 10),
                        color: AppColor.shadowColor.withOpacity(0.15)
                      ),
                      
                    ],
                    
                   ),
                   padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 5,
                    left: SizeConfig.widthMultiplier * 7,
                    right: SizeConfig.widthMultiplier * 7,
                    ),
                    width: SizeConfig.widthMultiplier * 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        appText(text: 'John', textColor: AppColor.white, fontSize: 20, fontweight: FontWeight.w700),
                       
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage('assets/profile/Location.png'), width: 15.36, height: 18.27,color: AppColor.white,),
                            SizedBox(width: 18,),
                             Expanded(child: appText(text: 'Address: 43 Oxford Road, M13 4GRManchester, UK',textAlign: TextAlign.start, fontSize: 15, textColor: AppColor.white, fontweight: FontWeight.w400))
                          ],
                        ),
                      ],
                    ),
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
                            offset: Offset(0,4),
                          )
                        ],
                        image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/7505201/pexels-photo-7505201.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'), fit: BoxFit.cover)
                      ),
                        height: SizeConfig.heightMultiplier * 12,
                        width: SizeConfig.widthMultiplier * 24,
                      ),
                   ),
                  
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SizedBox(
              
                height: SizeConfig.heightMultiplier * 61.86,
                width: SizeConfig.widthMultiplier * 100,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 100,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            richTextTile(label: 'Specialties: ', title: 'Architecture'),
                            richTextTile(label: 'Experience: ', title: '3 Years')
                          ],
                        ),
                    ),
                       SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  appText(text: 'Description', textColor: AppColor.labelColor,fontSize: 15, fontweight: FontWeight.w400),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.2,
                  ),
                  setupArtistdescriptionTile(
                    setupArtist2VM: setupArtist2VM,
    fontSize: 12,
                   lessText: 'This armchair is an elegant and functional piece of furniture. ',
                   moreText: 'This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work. '),
                    SizedBox(
                    height: 12,
                  ),
    
                  Container(
                    height: setupArtist2VM.isReadMore.value == false ? SizeConfig.heightMultiplier * 47 : SizeConfig.heightMultiplier * 42,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        staggeredGridTile(
                    setupArtist2VM: setupArtist2VM
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: appButton(onTap: (){
                                Get.to(CreateOrSelectProjectView(check: 2));
                              }, widget:appText(text: 'Request For Proposal', fontSize: 16,textAlign: TextAlign.center, fontweight: FontWeight.w700), buttonColor: AppColor.cyan, width: SizeConfig.widthMultiplier * 100, height: SizeConfig.heightMultiplier * 8, radius: 14),
                  )
                    ]),
                  ),
    
                  
                  ],
                ),
              ),
            )
          ],
        )
    // Stack(
    //         fit: StackFit.expand,
    //         clipBehavior: Clip.none,
    //         alignment: Alignment.center,
    //         children: [
    //           Column(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 21),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                      appButton(
    //                         onTap: (){
    //                          Navigator.of(context).pop();
    //                         }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
    //                         buttonColor: AppColor.white),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: SizeConfig.heightMultiplier * 2.9,
    //               ),
    //              Padding(
    //                padding: const EdgeInsets.symmetric(horizontal: 36),
    //                child: Column(
    //                crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                    Container(
    //                   decoration: BoxDecoration(
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Color(0xff2E404D).withOpacity(0.2),
    //                         blurRadius: 22,
    //                         spreadRadius: -1,
    //                         offset: Offset(0, 10)
    //                       )
    //                     ],
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: AppColor.cyan
    //                   ),
    //                   height: SizeConfig.heightMultiplier * 15,
    //                   width: SizeConfig.widthMultiplier * 100,
    //                 ),
    //                 SizedBox(
    //                   height: SizeConfig.heightMultiplier * 2.2,
    //                 ),
    //                 Container(
    //                   width: SizeConfig.widthMultiplier * 100,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       richTextTile(label: 'Specialties: ', title: 'Architecture'),
    //                       richTextTile(label: 'Experience: ', title: '3 Years')
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: SizeConfig.heightMultiplier * 1.2,
    //                 ),
    //                 appText(text: 'Description', textColor: AppColor.labelColor,fontSize: 15, fontweight: FontWeight.w400),
    //                 SizedBox(
    //                   height: SizeConfig.heightMultiplier * 0.2,
    //                 ),
    //                 setupArtistdescriptionTile(
    //                   setupArtist2VM: setupArtist2VM,
    // fontSize: 12,
    //                  lessText: 'This armchair is an elegant and functional piece of furniture. ',
    //                  moreText: 'This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work. '),
    //                 SizedBox(
    //                   height: 12,
    //                 ),
    //                 staggeredGridTile(
    //                   setupArtist2VM: setupArtist2VM
    //                 )
                  
    //                 ],
    //                ),
    //              )
    
    //             ],
    //           ),
    //           Positioned(
    //             top: SizeConfig.heightMultiplier * 2.2,
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Column(
    //                   children: [
    //                     Container(
    //                       height: 96,
    //                       width: 96,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         image: DecorationImage(image: NetworkImage('https://tinypng.com/images/social/website.jpg'),fit: BoxFit.cover),
    
    //                       ),
    //                     ),
    //                     appText(text: 'Panda', textColor: AppColor.white, fontSize: 20, fontweight: FontWeight.w700),
    //                     Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         ImageIcon(AssetImage('assets/home/Location.png'),color: AppColor.white,),
    //                         SizedBox(
    //                           width: SizeConfig.widthMultiplier * 2,
    //                         ),
    //                     appText(text: 'Address: 43 Oxford Road, M13 4GR\nManchester, UK', textColor: AppColor.white, fontSize: 15, fontweight: FontWeight.w400),
                          
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Positioned(
    //             left: 36,
    //             right: 36,
    //             bottom: SizeConfig.heightMultiplier * 1.498,
    //             child: appButton(onTap: (){
    //               Get.to(CreateOrSelectProjectView(check: 2));
    //             }, widget:appText(text: 'Request For Proposal', fontSize: 16,textAlign: TextAlign.center, fontweight: FontWeight.w700), buttonColor: AppColor.cyan, width: SizeConfig.widthMultiplier * 100, height: SizeConfig.heightMultiplier * 8, radius: 14))
    //         ],
    //       ),
      ),
    );
  }
}