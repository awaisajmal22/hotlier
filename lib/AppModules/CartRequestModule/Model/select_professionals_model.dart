import 'package:get/get.dart';

class SelectProfessionalModel{
  SelectProfessionalModel({
    required this.check,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.projectName
  });
  final String imageUrl;
  final String name;
  final String description;
  RxBool check;
  final String projectName;
}