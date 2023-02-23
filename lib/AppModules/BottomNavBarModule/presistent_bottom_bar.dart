import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import 'controller.dart';




class PresistentBottomBar extends StatelessWidget {
   PresistentBottomBar({super.key, required this.items});
  final List<PersistentTabItem> items;
  //  int controller.selectedIndex.value = 0;
 final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Obx(
            ()=> IndexedStack(
              index: controller.selectedIndex.value,
              children: items
                  .map((page) => Navigator(
                        key: page.navigatorKey,
                        onGenerateInitialRoutes: (navigator, intialRoute) {
                          return [
                            MaterialPageRoute(builder: (context) => page.tab)
                          ];
                        },
                      ))
                  .toList(),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 45),
            color: AppColor.white,
            child: Obx(
             ()=> BottomNavigationBar(
              elevation: 0,
              
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              backgroundColor: AppColor.transparent,
              selectedItemColor: AppColor.cyan,
              unselectedItemColor: AppColor.lightgrey,
                  currentIndex: controller.selectedIndex.value,
                  onTap: (index) {
                    if (index == controller.selectedIndex.value) {
                      items[index].navigatorKey.currentState
                          ?.popUntil((route) => route.isFirst);
                    } else {
                      
                        
                        controller.selectedIndex.value = index;
                        
                       
                       
                      
                    }
                  },
                  items: List.generate(items.length, (index) => BottomNavigationBarItem(     
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              items[index].icon,height: 20,
                              
                              width: 19, 
                              color: controller.selectedIndex.value  == index ? AppColor.cyan : AppColor.lightgrey
                            ),
                          ),
                          
                          label: items[index].title.toString())),
                      
              
              ),
            ),
          )),
        onWillPop: () async {
          if (items[controller.selectedIndex.value].navigatorKey.currentState?.canPop() ??
              false) {
            items[controller.selectedIndex.value].navigatorKey.currentState?.pop();
            return false;
          } else {
            return true;
          }
        });
  }
}

class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState> navigatorKey;
  final String title;
  final String icon;
  PersistentTabItem(
      {required this.tab,
      required this.navigatorKey,
      required this.title,
      required this.icon});
}
