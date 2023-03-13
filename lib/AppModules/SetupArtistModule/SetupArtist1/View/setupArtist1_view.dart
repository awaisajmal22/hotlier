import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist1/View/component/preofessional_search_tile.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist2/View/SetupArtist2_view.dart';
import 'package:hotlier/AppModules/SetupArtistModule/SetupArtist1/ViewModel/setupArtist1_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_button.dart';
import 'component/artist_tile.dart';

class SetupArtist1View extends StatelessWidget {
SetupArtist1View({super.key});
  final setupArtistVM = Get.put(SetupArtis1ViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
      preferredSize: Size(SizeConfig.widthMultiplier * 100, SizeConfig.heightMultiplier * 25),
      child:  Column(
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 6,
          ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   appButton(
                      onTap: (){
                       Navigator.of(context).pop();
                      }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                      buttonColor: AppColor.white),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(child: Padding(
                        padding:  EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                        child: appText(text: 'Here’s the Top Professionals',fontSize: 32, fontweight: FontWeight.w700, textColor: AppColor.textBlack),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.6,
            ),
            appText(text: 'Select the favorite Designer',fontSize: 16, fontweight: FontWeight.w400, textColor: const Color(0xff7A7A7A)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.3,
            ),
            professionalSearchTile(context)
        ],
      )),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 30
        ),
        itemBuilder: (context, index){
        return Obx(
         ()=> artistTile(
          name: 'Jack Rayn',
          specialties: 'Interior Designer',
          experience: '3 Years',
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SetupArtis2View()));
              setupArtistVM.selectedIndex.value = index;
            },
            selectedIndex: setupArtistVM.selectedIndex.value,
            index: index
          ),
        );
      }),
    );
  }

  
}