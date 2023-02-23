import 'package:get/get.dart';
import 'package:hotlier/AppModules/ExploreModule/Model/explore_model.dart';

class ExploreViewModel extends GetxController{
  RxBool check = false.obs;
  RxInt selectedColor = 0.obs;
  RxInt selectedMaterial = 0.obs;
  RxList<ExploreProductModel> prdocutList = <ExploreProductModel>[
    ExploreProductModel(imageUrl: 'assets/explore/1.png', check: false.obs, name: 'Wood Frame', price:'\$3:00'),
    ExploreProductModel(imageUrl: 'assets/explore/2.png', check: false.obs, name: 'Wood Frame', price:'\$3:00'),
    ExploreProductModel(imageUrl: 'assets/explore/3.png', check: false.obs, name: 'Wood Frame', price:'\$3:00'),
    ExploreProductModel(imageUrl: 'assets/explore/4.png', check: false.obs, name: 'Wood Frame', price:'\$3:00'),
    ExploreProductModel(imageUrl: 'assets/explore/5.png', check: false.obs, name: 'Wood Frame', price:'\$3:00'),
    ExploreProductModel(imageUrl: 'assets/explore/6.png', check: false.obs, name: 'Wood Frame', price:'\$3:00'),
  ].obs;
RxList colors = [
  'Black',
  'White',
  'Grey',
  'Red',
  'Orange',
  'Yellow',
  'Others'
].obs;
RxList material = [
  'Leather',
  'Cotton',
  'Acrylic',
  'Linen',
  'Velvet',
  'Vinyl',
  'Nylon',
  'others'
].obs;
}