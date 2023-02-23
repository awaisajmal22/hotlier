import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  final controller = PageController();
  RxInt productListIndex = (-1).obs;
  RxInt professionalListIndex = (-1).obs;
  RxInt carouselIndex = 1.obs;
  List images = [
    'https://images.pexels.com/photos/14005887/pexels-photo-14005887.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'https://images.pexels.com/photos/14005887/pexels-photo-14005887.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
    'https://images.pexels.com/photos/14005887/pexels-photo-14005887.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',

   
  ];
  List<ProductList> productList = [
    ProductList(icon: 'assets/home/products/1.png', name: "Furniture"),
    ProductList(icon: 'assets/home/products/2.png', name: "Dinning Table"),
    ProductList(icon: 'assets/home/products/3.png', name: "Outdoor"),
    ProductList(icon: 'assets/home/products/4.png', name: "Bedroom"),
    ProductList(icon: 'assets/home/products/5.png', name: "Floor Tile"),
    ProductList(icon: 'assets/home/products/6.png', name: "Kitchen"),
    ProductList(icon: 'assets/home/products/7.png', name: "Carpet"),
    ProductList(icon: 'assets/home/products/8.png', name: "Home Decor"),
    ProductList(icon: 'assets/home/products/9.png', name: "Bathroom"),
  ];

  List<ProfessionalsList> professionalsList = [
    ProfessionalsList(name: 'Architects', icon: 'assets/home/professionals/1.png'),
    ProfessionalsList(name: 'Specifiers', icon: 'assets/home/professionals/2.png'),
    ProfessionalsList(name: 'FF&E\nContractors', icon: 'assets/home/professionals/3.png'),
    ProfessionalsList(name: 'OS&E\nSuppliers', icon: 'assets/home/professionals/4.png'),
    ProfessionalsList(name: 'Interior\nDesigner', icon: 'assets/home/professionals/5.png'),
    ProfessionalsList(name: 'Manufacturers', icon: 'assets/home/professionals/6.png'),
  ];
  int get newIndex => carouselIndex.value;
  getIndex(int value){
    carouselIndex.value = value;
  }
 
}

class ProductList{
  final String icon;
  final String name;
 ProductList({
    required this.icon, required this.name
  });
}

class ProfessionalsList{
  final String name;
  final String icon;
   ProfessionalsList({
    required this.name, required this.icon
   });
}