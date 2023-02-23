import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartModule/ViewModel/cart_view_model.dart';
import 'package:hotlier/AppModules/CartRequestModule/View/CartRequestView/cart_request_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../common/app_button.dart';
import 'component/cart_tile.dart';

class CartView extends StatelessWidget {
  CartView({super.key, required this.projectName});
  final cartVM = Get.put(CartViewModel());
  String projectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomSheet: Container(
        height: SizeConfig.heightMultiplier * 25,
        color: AppColor.whiteF5,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 13),
             child: Column(
              children: [
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(text: 'Item total', textColor: Color(0xff979797),fontSize: 14, fontweight: FontWeight.w500),
                  appText(text: cartVM.cartList.length.toString(), textColor: Color(0xff979797),fontSize: 14, fontweight: FontWeight.w500),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                width: SizeConfig.widthMultiplier * 100,
                color: Color(0xffDADADA),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(text: 'Total', textColor: AppColor.textBlack,fontSize: 20, fontweight: FontWeight.w600),
                  

                  appText(text: '\$ 143', textColor: AppColor.textBlack,fontSize: 20, fontweight: FontWeight.w600),
                  
                ],
              ),
              ],
             ),
           ),
            appButton(onTap: (){
          Get.to(CartRequestView(projectName: projectName,));
        }, widget: appText(text: 'Select or create project', fontSize: 16, fontweight: FontWeight.w400, textColor: Color(0xffF3F5F6),), 
        height:  SizeConfig.heightMultiplier * 8.2,
        width: SizeConfig.widthMultiplier * 100,
         buttonColor: AppColor.cyan
        ),
          ],
        ),
      ),
      backgroundColor: AppColor.whiteF5,
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
                          appText(text: 'Add to Cart', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),
                          
                         
                ],
              ),
            ),
            SizedBox(
                            height: 31,
                          ),
            Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Color(0xffC2C3CB),
                                height: 1,
                              ),
                            ),
                            SizedBox(width: 4.5,),
                          appText(text: 'Products', fontSize: 20, fontweight: FontWeight.w400,textAlign: TextAlign.start, textColor: AppColor.textBlack.withOpacity(0.6)),
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
                         SizedBox(
                          height: 19,
                         ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20,),
                            height: SizeConfig.heightMultiplier  * 79.14,
                              
                            child:  ListView.builder(
                                  itemCount: cartVM.cartList.length,
                                  itemBuilder: (context, index){
                                  return Obx(
                                    ()=> cartTile(
                                       description: cartVM.cartList[index].description,
                                       price: cartVM.cartList[index].pirce,
                                      imageUrl: cartVM.cartList[index].imageUrl,
                                       itemcCount: cartVM.cartList[index].cartItemCount.value, 
                                       title: cartVM.cartList[index].title,
                                       decreament: (){
                                        if(cartVM.cartList[index].cartItemCount.value <= 0){
                                          cartVM.cartList[index].cartItemCount.value = 0;
                                        }
                                        else{
                                          cartVM.cartList[index].cartItemCount.value--;
                                        }
                                       },
                                       increament: (){
                                        cartVM.cartList[index].cartItemCount.value++; 
                                       }
                                       ),
                                  );
                                }),
                            ),
                            
                                                   
                              
                          
          ],
        ),
      ),
    );
  }

  
}