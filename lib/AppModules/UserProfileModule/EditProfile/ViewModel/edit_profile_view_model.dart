import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/EditProfile/Model/ueser_profile_model.dart';
import 'package:hotlier/AppModules/UserProfileModule/Model/profile_model.dart';
import 'package:hotlier/Network/api_services.dart';
import 'package:hotlier/Network/api_url.dart';
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
  
  Rx<UserProfileModel>? userDetail = UserProfileModel().obs;

  getUserDetail() async {
    try {
      var response = await API().getRequestHeader(ApiUrl.getUserProfile);
      print(response);
      if(response.statusCode == 200){
       print(response);
      }
    } on Exception catch (e){
      print(e.toString());
    } catch (e){
      return e;
    }
  }
}