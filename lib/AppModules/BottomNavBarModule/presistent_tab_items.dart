import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:hotlier/AppModules/ExploreModule/View/Explore1/explore_view.dart';

import '../FavoriteModule/View/favorite_view.dart';
import '../HomeModule/View/home_view.dart';
import '../UserProfileModule/Profile/View/user_profile_view.dart';
import 'controller.dart';
import 'presistent_bottom_bar.dart';

class PresistentBottomBarItems extends StatelessWidget {
  // const PresistentTabItems({super.key}
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();
  final _tab5navigatorKey = GlobalKey<NavigatorState>();
 final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return PresistentBottomBar(
        items: [
          PersistentTabItem(
              tab: HomeView(),
              navigatorKey: _tab1navigatorKey,
              title: 'Home',
              icon: 'assets/navbar/Home.png'),
          PersistentTabItem(
              tab: ExploreView(backButtonCheck: false,),
              navigatorKey: _tab2navigatorKey,
              title: 'Explore',
              icon: 'assets/navbar/Search.png'),
          PersistentTabItem(
              tab: FavoriteView(check: false,),
              navigatorKey: _tab3navigatorKey,
              title: 'Favorite',
              icon: 'assets/navbar/Heart.png'),
          PersistentTabItem(
              tab: UserProfileView(check: false,),
              navigatorKey: _tab4navigatorKey,
              title: 'Profile',
              icon: 'assets/navbar/Profile.png')
        ],
      
    );
  }
}
