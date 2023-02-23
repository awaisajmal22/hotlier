import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/Model/your_request_model.dart';
import 'package:hotlier/AppModules/UserProfileModule/View/YourRequest/your_request_cart_view.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_button.dart';
import '../../../../../common/app_color.dart';
import '../../../ViewModel/select_or_create_project_view_model.dart';
import 'component/request_tile.dart';

class RequestView extends StatelessWidget {
 RequestView({super.key, required this.date, required this.data});
 String? date;
List<dynamic> data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
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

                                          appText(text: 'Request', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),     
                                ],
                              ),
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 88.23,
              child: ListView(
              padding: EdgeInsets.only(top: 38),
                
                  children: [
                        Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xffC2C3CB),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 4.5,),
                        appText(text: date!, fontSize: 20, fontweight: FontWeight.w400,textAlign: TextAlign.start, textColor: AppColor.textBlack.withOpacity(0.6)),
                        SizedBox(
                          width: 4.5,
                        ),
                        Expanded(
                          child: Container(
                              color: Color(0xffC2C3CB),
                              height: 1,
                            ),
                        ),
                        ],
                       ),
                        Column(
                          
                        children: List.generate(
                          growable: true,
                          data.length, (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: GestureDetector(
                              onTap: (){
                              
                              },
                              child: requestTile(index: index, data:data, onTap: (){
                                Get.to(YourRequestCartView(
                                  imageUrl: data[index].imageUrl,
                                  name: data[index].name,
                                  date: date,
                                ));
                              }),
                            ),
                          )
                        ))
                  ],
                )
              
            )
        ],
      )),
    );
  }

  
}