import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartModule/View/cart_view.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/cart_request_view.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/SelectProfessionalView/select_professional_view.dart';
import 'package:hotlier/AppModules/DetailModule/ViewModel/detail_view_model.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/colors_tile.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/customization_tile.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/dimension_tile.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/material_tile.dart';
import 'package:hotlier/AppModules/DetailModule/View/component/stack_image_tile.dart';
import 'package:hotlier/AppModules/UserProfileModule/YourRequest/your_request_cart_view.dart';
import 'package:hotlier/common/TextField/text_field.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../common/app_button.dart';
import '../../UserProfileModule/Request/View/request_View.dart';
import '../../UserProfileModule/CreateOrSelectProject/View/create_or_select_project_view.dart';
import 'component/description_tile.dart';
import 'component/title_tile.dart';

class DetailView extends StatelessWidget {
 DetailView({super.key});
  final detailVM = Get.put(DetailViewModel());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        bottomSheet: MediaQuery.of(context).viewInsets.bottom !=0? null :Container(
          padding: const EdgeInsets.symmetric( horizontal: 22, vertical: 10),
          height: SizeConfig.heightMultiplier * 10,
          width: SizeConfig.widthMultiplier * 100,
          child: appButton(onTap: (){
            Get.to(CreateOrSelectProjectView( check:  0,));
          }, widget: appText(text: 'Add to inquiry Cart', fontSize: 16, fontweight: FontWeight.w400, textColor: const Color(0xffF3F5F6),), 
          height:  SizeConfig.heightMultiplier * 10,
          width: SizeConfig.widthMultiplier * 100,
           buttonColor: AppColor.cyan
          ),
        ),
        // bottomSheet: Container(
        //   height: SizeConfig.heightMultiplier * 20,
        //   color: Colors.red,
        // ),
        backgroundColor: const Color(0xffF3F6F8),
        body: SafeArea(
          child: Column(
            
            children: [
                    titleTile(
                      context, 
                      title: 'Chair',
                      subtitle: 'Jack',
                      description: "Brazil"
                      ),
                   
              const SizedBox(
                height: 18,
              ),
           
           
            Expanded(
              child: SizedBox(
                
                height: SizeConfig.heightMultiplier * 75,
                child: ListView(
                  children: [
                    detailStackImageTile(detailVM: detailVM),
                     const SizedBox(
              height: 16,
                     ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           colorsTile(detailVM: detailVM),
                              const SizedBox(
                                height: 18,
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              dimentionTile(detailVM: detailVM, context: context),
                          const SizedBox(width: 10,),
                          materialTile(detailVM: detailVM)
                              
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          appText(text: 'Description', fontSize: 18, fontweight: FontWeight.w500, textColor: AppColor.darkgrey),
                          const SizedBox(
                            height: 2,
                          ),
                         descriptionTile(
                          detailVM: detailVM,
                          lessText: 'This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with ',
                          moreText: 'This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work. ' ,
                         ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          appText(text: 'Customization instruction', fontSize: 18, fontweight: FontWeight.w500, textColor: AppColor.darkgrey),
                              
                      customizationTile(),
                              const SizedBox(
                                height: 30,
                              )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ],
          )
          ),
      ),
    );
  }

 
}


 



