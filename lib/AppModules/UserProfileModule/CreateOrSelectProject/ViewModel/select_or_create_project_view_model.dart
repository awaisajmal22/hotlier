import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/size_config.dart';
import '../../../CartRequestModule/Model/select_professionals_model.dart';
import '../../Model/your_request_model.dart';

class RequestProjectViewModel extends GetxController{
  final addProjectController = TextEditingController();
  RxBool scopecheck = false.obs;
  RxBool projectcheck = false.obs;
  RxBool downloadImageCheck = false.obs;
  RxString projectName = 'Select Project'.obs;
  RxString scope = 'Scope'.obs;
  RxInt selectedImageIndex = (-1).obs;
  
   final projectController = TextEditingController();
  RxList<AllRequestModel> allRequestList = <AllRequestModel>[
    //All project Model
    AllRequestModel(
      date: '20, feb ,2023', projectModel: [
      // Project Name and date
      ProjectModel
      (
        projectName: 'Project 1',
       projectDataModel: [
        //Project Data 1
        ProjectDataModel(
          imageUrl: 'https://cdn.pixabay.com/photo/2023/02/08/07/32/vietnamese-woman-7775904__340.jpg', 
          name: 'Marre',
           description: 'dsfffffffffffffffffffffff', 
           isComplete: false.obs
           ),
           ProjectDataModel(imageUrl: 'https://cdn.pixabay.com/photo/2023/01/23/09/26/cat-7738210__340.jpg', name: 'Cat', description: 'My Cat is Beautiful', isComplete: false.obs)
      ]),

      ProjectModel(projectName:'Project 2', projectDataModel: [
        ProjectDataModel(imageUrl: 'https://cdn.pixabay.com/photo/2023/02/13/10/30/eye-7787024__340.jpg', name: "eye", description: 'description', isComplete: false.obs)
      ]),

       ProjectModel
      (
        projectName: 'Project 3',
       projectDataModel: [
        //Project Data
        ProjectDataModel(
          imageUrl: 'https://cdn.pixabay.com/photo/2023/02/08/07/32/vietnamese-woman-7775904__340.jpg', 
          name: 'Marre',
           description: 'dsfffffffffffffffffffffff', 
           isComplete: false.obs
           ),

           ProjectDataModel(imageUrl: 'https://cdn.pixabay.com/photo/2023/01/23/09/26/cat-7738210__340.jpg', name: 'Cat', description: 'My Cat is Beautiful', isComplete: false.obs)
      ]),
      ProjectModel(projectName:'Project 4', projectDataModel: [
        ProjectDataModel(imageUrl: 'https://cdn.pixabay.com/photo/2023/02/13/10/30/eye-7787024__340.jpg', name: "eye", description: 'By Duhome Elegant Lifestyle', isComplete: false.obs)
      ]),
      
    ]),
    AllRequestModel(date: '10, March , 2023', projectModel: [
      ProjectModel(projectName: 'Project 3', projectDataModel:[
        ProjectDataModel(imageUrl: 'https://cdn.pixabay.com/photo/2022/10/26/18/19/architecture-7549184__340.jpg', name: "Buildings", description: 'description', isComplete: false.obs)
      ])
    ])
  ].obs;
 
   
}