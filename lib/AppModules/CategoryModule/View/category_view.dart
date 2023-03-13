import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CategoryModule/View/component/category_tile.dart';
import 'package:hotlier/AppModules/ExploreModule/View/Explore1/explore_view.dart';
import 'package:hotlier/AppModules/HomeModule/ViewModel/home_view_model.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:hotlier/common/size_config.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.categoryList, required this.buttonIndex, required this.onTapFunction});
  final List<dynamic> categoryList;
  RxInt buttonIndex;
  VoidCallback onTapFunction;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      
      body: SafeArea(
        child: Column(
          children: [
       Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appButton(
                      onTap: (){
                       Navigator.of(context).pop();
                      }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                      buttonColor: AppColor.white),
                      appText(text: 'Category', textColor: const Color(0xff171717), fontSize: 24, fontweight: FontWeight.w700),
                      const SizedBox(
                        width: 45,
                      ),
                  ],
                ),
              ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 70,
              child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 31),
                      itemCount: categoryList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
      
                    ), itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          buttonIndex.value = index;
                          onTapFunction();
                        },
                        child:  Obx(()=> categoryTile(buttonIndex.value, index, categoryList)));
                    }),
            ),
          ],
        ),
      ),
          
    
    );
  }
}