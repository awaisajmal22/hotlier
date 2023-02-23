import 'package:get/get.dart';

class CartModel{
  String title;
  String description;
  RxInt cartItemCount;
  double pirce;
  String imageUrl;
  CartModel({
    required this.title,
    required this.cartItemCount,
    required this.description,
    required this.pirce,
    required this.imageUrl
  });
}