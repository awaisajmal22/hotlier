

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartRequestModule/Model/select_professionals_model.dart';
import 'package:hotlier/common/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class CartRequestViewModel extends GetxController{
  final messageController = TextEditingController();
  final addProjectController = TextEditingController();
  final searchProfessionalsController = TextEditingController();
  RxBool scopecheck = false.obs;
  RxBool projectcheck = false.obs;
  RxBool cameracheck = false.obs;
  RxString projectName = 'Select Project'.obs;
  Rx<DateTime> choosedDate = DateTime.now().obs;
  RxString scope = 'Scope'.obs;

  // RxList<SelectProfessionalModel> selectProfessionalsList = <SelectProfessionalModel>[
  //   SelectProfessionalModel(check: false.obs, name: 'Jack', description: 'Alegria', imageUrl: 'https://images.pexels.com/photos/15494499/pexels-photo-15494499.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
  //   SelectProfessionalModel(check: false.obs, name: 'John', description: 'Brazil', imageUrl: 'https://images.pexels.com/photos/7505201/pexels-photo-7505201.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
  //   SelectProfessionalModel(check: false.obs, name: 'Mac', description: 'America', imageUrl: 'https://images.pexels.com/photos/10869715/pexels-photo-10869715.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
  //   SelectProfessionalModel(check: false.obs, name: 'Roso', description: 'England', imageUrl: 'https://images.pexels.com/photos/15505145/pexels-photo-15505145.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
  //   SelectProfessionalModel(check: false.obs, name: 'WWw', description: 'New york', imageUrl: 'https://images.pexels.com/photos/15505145/pexels-photo-15505145.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
  //   SelectProfessionalModel(check: false.obs, name: 'Maree', description: 'New york', imageUrl: 'https://images.pexels.com/photos/15099288/pexels-photo-15099288.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
  // ].obs;

  // RxList<SelectProfessionalModel> professionals = <SelectProfessionalModel>[

  // ].obs;


  List projectNameList = [
    'Project Name 1',
    'Project Name 2',
    'Project Name 3',
    'Project Name 4',
    'Project Name 5',
    'Project Name 6',
  ];
  List scopeList = [
"Hotel - Guest Room",
"Hotel - Guest Room Washroom",
"Hotel - Suite",
"Hotel - Lobby",
"Hotel - Corridor",
"Hotel - Public Area",
"Hotel - All Day Dining",
"Hotel - Other",
"Restaurant",
  ];
final ImagePicker imagePicker = ImagePicker();
RxList<XFile>? newimagesList = <XFile>[].obs;
Future getCameraImage() async {
  final selectImage = await imagePicker.pickImage(source: ImageSource.camera);
  if(selectImage != null){
    newimagesList!.add(selectImage);
  }
}
Future getImage() async {
  final selectImage = await imagePicker.pickMultiImage();
  if(selectImage.isNotEmpty){
    newimagesList!.addAll(selectImage);
  }
}
 String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = [" Bytes", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
void showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: SizeConfig.heightMultiplier * 40,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 30,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          choosedDate.value = val;
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }
}