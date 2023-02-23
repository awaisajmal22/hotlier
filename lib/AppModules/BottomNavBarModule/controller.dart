import 'package:get/get.dart';

class NavBarController extends GetxController{
  RxInt selectedIndex = 0.obs;
  selected(int value){
    selectedIndex.value = value;
  }
}