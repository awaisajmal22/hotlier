import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../common/app_Text.dart';
import '../../../../common/app_button.dart';
import '../../../../common/app_color.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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

                                          appText(text: 'Settings', fontSize: 24, fontweight: FontWeight.w700, textColor: AppColor.textBlack),     
                                ],
                              ),
            ),
          ],
        )),
    );
  }
}