import 'package:get/get.dart';

class ExploreProductModel{
  String imageUrl;
  String name;
  String price;
  RxBool check;
  ExploreProductModel({
    required this.imageUrl,
    required this.check,
    required this.name,
    required this.price,
  });
}