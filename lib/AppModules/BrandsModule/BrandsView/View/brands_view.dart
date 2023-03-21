import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/BrandsModule/BrandsView/ViewModel/brands_viewmodel.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import 'component/brands_grid_tile.dart';
import 'component/brands_search_tile.dart';

class BrandsView extends StatelessWidget {
   BrandsView({super.key});
  final brandsVM = Get.put(BrandsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                appButton(
                        onTap: (){
                         Navigator.of(context).pop();
                        }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                        buttonColor: AppColor.white),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                children: [
                  Row(

                    children: [
                      brandsSearchTile(context),
                      const SizedBox(
                        width: 7,
                      ),
                     Obx(
                       ()=> GestureDetector(
                            onTap: (){
                              brandsVM.check.value = !brandsVM.check.value;
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
                              child: brandsVM.check.value ? Image.asset('assets/explore/card.png') : const FaIcon(FontAwesomeIcons.list, color: AppColor.darkgrey,),
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
                 brandsGridTile(context, brandsVM: brandsVM, title: 'Carpet Brand', subtitle: 'Carpet Designer', imageUrl: 'https://cdn.pixabay.com/photo/2023/01/21/02/40/cat-7732877__340.jpg'),
                  ],
                 )
                       
                ],
              ),
            ),
          ],
        )),
    );
  }
  }
