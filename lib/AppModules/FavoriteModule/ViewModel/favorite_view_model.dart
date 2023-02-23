import 'package:get/get.dart';
import 'package:hotlier/AppModules/ExploreModule/Model/explore_model.dart';

class FavoriteViewModel extends GetxController{
  RxList<ExploreProductModel> favoriteproductList = <ExploreProductModel>[].obs;
  
}