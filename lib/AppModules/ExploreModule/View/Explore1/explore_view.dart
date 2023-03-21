import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/ExploreModule/ViewModel/explore_view_model.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_Text.dart';
import 'component/grid_view_tile.dart';
import 'component/search_tile.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key, required  this.backButtonCheck});
  final exploreVM = Get.put(ExploreViewModel());
 bool? backButtonCheck;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    backButtonCheck == false ? Container() :  appButton(
                          onTap: (){
                            print(backButtonCheck);
                           Navigator.of(context).pop();
                          }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                          buttonColor: AppColor.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Row(
    
                      children: [
                        searchTile(context,suffixIcon: null,controller: null ),
                        const SizedBox(
                          width: 7,
                        ),
                       Obx(
                         ()=> GestureDetector(
                              onTap: (){
                                exploreVM.check.value = !exploreVM.check.value;
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                alignment: Alignment.center,
                                height: 51,
                                width: 51,
                                decoration: BoxDecoration(
                                  color: AppColor.buttonColor,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: exploreVM.check.value ? Image.asset('assets/explore/card.png') : const FaIcon(FontAwesomeIcons.list, color: AppColor.darkgrey,),
                              ),
                            ),
                       ),
      
      
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                    width: SizeConfig.widthMultiplier * 100,
                    height: 1,
                    color: AppColor.buttonColor,
                   ),
                      ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        child: appText(
                              text: "Found 50 results".toUpperCase(),
                              fontSize: 12,
                              fontweight: FontWeight.w500,
                              textColor: AppColor.lightgrey,
                            ),
                      ),
      gridViewTile(context, exploreVM: exploreVM, backButtonCheck: backButtonCheck!),
                    ],
                   )
                         
                  ],
                ),
              ),
            ],
          )),
      ),
    );
  }
}