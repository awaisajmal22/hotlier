import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

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
                                     appButton(
                                          onTap: (){
                                           Navigator.of(context).pop();
                                          }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                          buttonColor: AppColor.white),
                                          SizedBox( width: 22,),

                                          appText(text: 'About Us', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),     
                                ],
                              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 88.23,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 38),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/splash/logo.png'), height: 90.68,width: 96.95,color: AppColor.cyan,),
                      SizedBox(
                        height: 6.49,
                      ),
                      Image(image: AssetImage('assets/splash/text.png'),width: SizeConfig.widthMultiplier * 35,color: AppColor.cyan,),
                      SizedBox(
                        height: 22,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: appText(text: 'Introduction', textColor: AppColor.textBlack, fontSize: 20, fontweight: FontWeight.w700, )),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: appText(
                            textAlign: TextAlign.justify,
                            text: 'Lorem ipsum dolor sit amet consectetur. Iaculis in quam scelerisque fames convallis gravida ultricies sed massa. Neque commodo dolor vel morbi non condimentum purus. Fames sit integer augue quam. Commodo molestie non pellentesque imperdiet. Id tellus nibh ipsum in neque sit congue. In amet tellus diam dignissim nulla dui ac. Venenatis eu purus at at dui quis elementum risus.',
                             fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.shadowColor),
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Align(
                        alignment: Alignment.centerLeft,
                        child: appText(text: 'Vision', textColor: AppColor.textBlack, fontSize: 20, fontweight: FontWeight.w700, )),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: appText(
                            textAlign: TextAlign.justify,
                            text: 'Lorem ipsum dolor sit amet consectetur. Iaculis in quam scelerisque fames convallis gravida ultricies sed massa. Neque commodo dolor vel morbi non condimentum purus. Fames sit integer augue quam. Commodo molestie non pellentesque imperdiet. Id tellus nibh ipsum in neque sit congue. In amet tellus diam dignissim nulla dui ac. Venenatis eu purus at at dui quis elementum risus.',
                             fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.shadowColor),
                        ),
                         SizedBox(
                          height: 27,
                        ),
                        Align(
                        alignment: Alignment.centerLeft,
                        child: appText(text: 'Mission', textColor: AppColor.textBlack, fontSize: 20, fontweight: FontWeight.w700, )),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: appText(
                            textAlign: TextAlign.justify,
                            text: 'Lorem ipsum dolor sit amet consectetur. Iaculis in quam scelerisque fames convallis gravida ultricies sed massa. Neque commodo dolor vel morbi non condimentum purus. Fames sit integer augue quam. Commodo molestie non pellentesque imperdiet. Id tellus nibh ipsum in neque sit congue. In amet tellus diam dignissim nulla dui ac. Venenatis eu purus at at dui quis elementum risus.',
                             fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.shadowColor),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}