import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotlier/common/app_color.dart';

import 'AppModules/SplashModule/View/splash_view.dart';
import 'common/size_config.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return  GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: GetMaterialApp(
            theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: AppColor.cyan,
          ),
        ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
            home:  SplashView(),
          ),
        );
      });
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}