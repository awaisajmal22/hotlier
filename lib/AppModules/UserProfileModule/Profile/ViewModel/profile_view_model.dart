import 'package:get/get.dart';
import 'package:hotlier/AppModules/UserProfileModule/Model/profile_model.dart';

class UserProfileViewModel extends GetxController{
RxInt selectedIndex = (-1).obs;
  List<ProfileModel> profileTileList = <ProfileModel>[
    ProfileModel(title: 'Edit Profile', leadingIcon: 'assets/profile/Profile.png'),
    ProfileModel(title: 'Your Requests', leadingIcon: 'assets/profile/Message.png'),
    ProfileModel(title: 'Favorites', leadingIcon: 'assets/profile/Heart.png'),
    ProfileModel(title: 'Notifications', leadingIcon: 'assets/profile/bell.png'),
    ProfileModel(title: 'Settings', leadingIcon: 'assets/profile/setting.png'),
    ProfileModel(title: 'About Us', leadingIcon: 'assets/profile/about.png'),
    ProfileModel(title: 'Logout', leadingIcon: 'assets/profile/Logout.png'),
  ];
}