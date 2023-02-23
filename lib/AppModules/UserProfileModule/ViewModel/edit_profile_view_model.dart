import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/Model/profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class EditProfileViewModel extends GetxController{
  List<ProfileModel> editPorfileList = <ProfileModel>[
    ProfileModel(title: 'Take a photo', leadingIcon: 'assets/profile/cam2.png'),
    ProfileModel(title: 'Your Photo', leadingIcon: 'assets/profile/Image.png'),
    ProfileModel(title: 'Delete current photo', leadingIcon: 'assets/profile/Delete.png'),
  ];
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bussinessController = TextEditingController();
  final addressController = TextEditingController();
  RxBool readOnly1 = true.obs;
  RxBool readOnly2 = true.obs;
  RxBool readOnly3 = true.obs;
  RxBool readOnly4 = true.obs;


  RxString image = ''.obs;
  final pickedImage = ImagePicker();
  Future getImageFormCamera() async {
    final selectedImage = await pickedImage.pickImage(source: ImageSource.camera);
    if(selectedImage != null){
      image.value = selectedImage.path;
    }
  }
  Future getImageFormStorage() async {
    final selectedImage = await pickedImage.pickImage(source: ImageSource.gallery);
    if(selectedImage != null){
      image.value = selectedImage.path;
    }
  }

  deleteImage(){
    image.value = '';
  }
}