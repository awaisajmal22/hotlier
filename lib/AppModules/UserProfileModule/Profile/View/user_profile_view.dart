import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/AuthModule/login/View/login_view.dart';
import 'package:hotlier/AppModules/AuthModule/login/ViewModel/login_view_model.dart';
import 'package:hotlier/AppModules/FavoriteModule/View/favorite_view.dart';
import 'package:hotlier/AppModules/SettingModule/Setting/View/settings_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/About/View/about_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/EditProfile/View/edit_profile_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/Notification/View/notification_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/Profile/View/component/lodout_dailog.dart';
import 'package:hotlier/AppModules/UserProfileModule/CreateOrSelectProject/View/create_or_select_project_view.dart';
import 'package:hotlier/AppModules/UserProfileModule/Profile/ViewModel/profile_view_model.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import '../../../../common/size_config.dart';
import 'component/user_profile_tile.dart';

class UserProfileView extends StatelessWidget {
   UserProfileView({super.key, required this.check});
  final userProfileVM = Get.put(UserProfileViewModel());
  final loginVM = Get.put(LoginViewModel());
  bool? check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteF5,
      body: Column(
        children: [
          Container(
            color: AppColor.transparent,
            height: SizeConfig.heightMultiplier * 34,
            width: SizeConfig.widthMultiplier * 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 9, top: SizeConfig.heightMultiplier * 6),
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                              ),
                              image: DecorationImage(image: AssetImage('assets/auth/login.png'),fit: BoxFit.cover)
                              
                            ),
                            width: SizeConfig.widthMultiplier * 100,
                    height: SizeConfig.heightMultiplier * 33,
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                             check == false ? Container(
                              height: 45,
                             ) :    appButton(
                                        onTap: (){
                                         Navigator.of(context).pop();
                                        }, widget: const Icon(Icons.keyboard_arrow_left, color: AppColor.darkgrey,size: 30), radius: 15, height: 45, width: 45, 
                                        buttonColor: AppColor.white),
                                        const SizedBox( width: 22,),

                                        appText(text: 'Profile', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.white),     
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
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: -1,
                        blurRadius: 22,
                        offset: const Offset(0, 10),
                        color: AppColor.shadowColor.withOpacity(0.15)
                      )
                    ]
                   ),
                   padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 2,
                    left: SizeConfig.widthMultiplier * 7,
                    right: SizeConfig.widthMultiplier * 7,
                    ),
                    width: SizeConfig.widthMultiplier * 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        appText(text: 'John', textColor: AppColor.cyan, fontSize: 24, fontweight: FontWeight.w700),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(image: AssetImage('assets/home/Location.png'), width: 15.36, height: 18.27,color: AppColor.textBlack,),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(child: appText(text: 'Address: 43 Oxford Road, M13 4GR Manchester, UK',textAlign: TextAlign.start, fontSize: 15, textColor: AppColor.textBlack))
                          ],
                        ),
                      ],
                    ),
                  )
                ),
                 Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/7505201/pexels-photo-7505201.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'), fit: BoxFit.cover)
                  ),
                    height: SizeConfig.heightMultiplier * 12.5,
                    width: SizeConfig.widthMultiplier * 25.5,
                  ),
                
              ],
            )
          ),
          
          SizedBox(
            height: SizeConfig.heightMultiplier * 59,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
              itemCount: userProfileVM.profileTileList.length,
              itemBuilder: (context, index){
              return Obx(
                ()=> userProfileTile(
                  icon: userProfileVM.profileTileList[index].leadingIcon,
                  index: index,
                  selectedIndex: userProfileVM.selectedIndex.value,
                  onTap: (){
                    print(userProfileVM.selectedIndex.value);
                    userProfileVM.selectedIndex.value = index;
                    if(userProfileVM.selectedIndex.value == 0){
                      Get.to(EditProfileView());
                    }
                    else if(userProfileVM.selectedIndex.value == 1 ){
                      Get.to(CreateOrSelectProjectView(check: 1,));
                    }
                    else if(userProfileVM.selectedIndex.value == 2){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FavoriteView(check: true)));
                    }
                    else if(userProfileVM.selectedIndex.value == 3){
                      Get.to( NotificationView());
                    }
                    else if(userProfileVM.selectedIndex.value == 4){
                      Get.to(SettingsView());
                    }
                    else if(userProfileVM.selectedIndex.value == 5){
                      Get.to(const AboutView());
                    }
                    else if(userProfileVM.selectedIndex.value == 6){
                      logoutDailog(context, (){
                        loginVM.signOut();
                        Get.offAll(LoginView());
                      });
                    }
                  },
                   title: userProfileVM.profileTileList[index].title
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  
}