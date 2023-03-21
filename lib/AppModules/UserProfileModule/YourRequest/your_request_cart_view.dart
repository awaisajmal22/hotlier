import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/CreateOrSelectProject/ViewModel/select_or_create_project_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../common/app_Text.dart';
import '../../../common/app_button.dart';
import '../../../common/app_color.dart';
import 'component/dealer_profileTile.dart';
import 'component/pictures_tile.dart';
import 'component/profile_tile.dart';

class YourRequestCartView extends StatelessWidget {
   YourRequestCartView({super.key, required this.date, required this.imageUrl, required this.name});
  String? date;
  String? imageUrl;
  String? name;
  final requestProjectVM = Get.put(RequestProjectViewModel());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
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
                                            const SizedBox( width: 22,),
    
                                            appText(text: 'Your Request', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),     
                                  ],
                                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 88.23,
                child: ListView(
                padding: const EdgeInsets.only(top: 38),
    
                  children: [
                    Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: const Color(0xffC2C3CB),
                                height: 1,
                              ),
                            ),
                            const SizedBox(width: 4.5,),
                          appText(text: date!, fontSize: 20, fontweight: FontWeight.w400,textAlign: TextAlign.start, textColor: AppColor.textBlack.withOpacity(0.6)),
                          const SizedBox(
                            width: 4.5,
                          ),
                          Expanded(
                            child: Container(
                                color: const Color(0xffC2C3CB),
                                height: 1,
                              ),
                          ),
                          ],
                         ),
                         profileTile(
                          imageUrl: 'https://cdn.pixabay.com/photo/2021/12/29/08/18/insect-6900940__340.jpg',
                          description: 'Lorem ipsum dolor sit amet consectetur. Egestas vivamus at eget accumsan sa...',
                          name: 'John Wick'
                         ),
                         Container(
                          width: SizeConfig.widthMultiplier * 100,
                             color: const Color(0xffC2C3CB),
                             height: 1,
                           ),
                          
                          dealerProileTile(
                            imageUrl: imageUrl!,
                            name: name!,
                            message: 'Hi Jhon,\nLorem ipsum dolor sit amet consectetur. Odio nulla nisi arcu sed ac sit fermentum molestie aliquam. Sed non cursus aliquam laoreet nunc facilisi viverra etiam. Volutpat commodo suspendisse tellus sed faucibus rhoncus egestas tempus...',
    
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                          height: 97,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 14.5),
                            itemCount: 8,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                            return  Obx(
                              ()=> picturesTile(
                                onTap: (){
                                  requestProjectVM.selectedImageIndex.value = index;
                                },
                                index: index,
                                selectedImageIndex: requestProjectVM.selectedImageIndex.value,
                                name: 'SLlsS',
                                size: 'ADDADA',
                              imageUrl: "https://cdn.pixabay.com/photo/2021/10/01/18/53/corgi-6673343__340.jpg"
                                                    ),
                            );
                          }),
                        ),
                         
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 23),
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.buttonColor,
                              
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Image(image: AssetImage('assets/profile/pdf.png'),
                                    height: 21.75, width: 21.75,),
                                    const SizedBox(
                                      width: 19,
                                    ),
                                    appText(text: 'Tender documentation ........final.pdf', fontSize: 12, fontweight: FontWeight.w400, textColor: AppColor.textBlack)
                                  ],
                                ),
                                const Image(image: AssetImage('assets/profile/download.png'),
                                    height: 18.36, width: 15.55,),
                              ],
                            ),
                          )
                  ],
                ),
              )
    
            ],
          ),
        ),
      ),
    );
  }

  
 

  
}