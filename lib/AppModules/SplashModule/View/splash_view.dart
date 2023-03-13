import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/OnBoardingModule/View/on_boarding_view.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_button.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {

    Timer(const Duration(seconds: 3), ()=>Get.to(OnBoardingView()));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
        const Image(image: AssetImage('assets/splash/splash.png'),fit: BoxFit.cover, height: double.maxFinite,
        width: double.maxFinite,),
       const  Image(image: AssetImage('assets/splash/background.png'),fit: BoxFit.cover, height: double.maxFinite,
        width: double.maxFinite,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
        const Image(image: AssetImage('assets/splash/logo.png'),fit: BoxFit.cover,width: 143.9,
        ),
const SizedBox(
  height: 9.6,
),
       const  Image(image: AssetImage('assets/splash/text.png'),fit: BoxFit.cover,width: 221,),
          ],
        )
        ],
      ),
    );
  }
}