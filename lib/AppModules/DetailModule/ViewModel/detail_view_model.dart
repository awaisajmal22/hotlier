import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailViewModel extends GetxController{
  final descriptionController = TextEditingController();
  final dimension1Controller = TextEditingController();
  final dimension2Controller = TextEditingController();
  final dimension3Controller = TextEditingController();
  final focusNode = FocusNode();
  RxInt selectImage = 0.obs;
  RxInt selectedColor = 0.obs;
RxBool isReadMore = false.obs;
RxInt selectedImageButton = 0.obs;
  List images = [
    "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg",
    'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__340.jpg',
    'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg'
  ];
  List colors = [
    Color(0xffD4D4D4),
    Color(0xffF2A3FF),
    Color(0xff323142),
    Color(0xff810000),
    Color(0xffF3E181),
    Color(0xff7BA275),
    Color(0xffFF6565),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
    Color(0xff8B3A00),
  ];


  // dimension Tile
  RxString dimension = 'Select or add dimension'.obs;
  RxString selectedDimension = ''.obs;
  RxInt selectedDimensionIndex = (-1).obs ;

  List dimensionList = [
    'W:  25  ;  H:  17  ;  D:  26',
    'W:  25  ;  H:  17  ;  D:  26',
    'W:  25  ;  H:  17  ;  D:  26',
    'W:  25  ;  H:  17  ;  D:  26',
  ];

  // Material Tile
  RxString material = 'Synthetic rattan'.obs;
  List materialList = [
    'saddsasad',
    'dsadsad',
    'dsadsa'
  ];
}