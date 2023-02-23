import 'package:get/get.dart';

class AllRequestModel{
  String date;
  List<ProjectModel> projectModel;
  AllRequestModel({
    required this.date,
    required this.projectModel
  });
}

class ProjectModel{
String projectName;
List<ProjectDataModel> projectDataModel;
ProjectModel({
  required this.projectName,
  required this.projectDataModel,

});
}

class ProjectDataModel{
  String imageUrl;
  String name;
  String description;
  RxBool isComplete;
  ProjectDataModel({
    required this.imageUrl,
    required this.name,
    required this.description,
  required  this.isComplete,
  });
}