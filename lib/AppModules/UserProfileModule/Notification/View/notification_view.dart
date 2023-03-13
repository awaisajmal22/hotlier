import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/Notification/ViewModel/notification_view_model.dart';
import 'package:hotlier/common/size_config.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';
import 'component/sildable_tile.dart';

class NotificationView extends StatelessWidget {
 NotificationView({super.key});
  final notificationVM = Get.put(NotificationViewModel());

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
                                          const SizedBox( width: 22,),

                                          appText(text: 'Notification', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack, textOverflow: TextOverflow.ellipsis),     
                                ],
                              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 32),
              height: SizeConfig.heightMultiplier * 88.23,
              child: slidableTile(notification: notificationVM.notificationList)
            )
          ],
        )),
    );
  }

  
}