import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
         this.id,
        this.name,
        this.username,
        this.uid,
        this.email,
       this.phoneNo,
        this.otp,
       this.role,
        this.platform,
        this.isVerified,
        this.expiresAt,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.userProfile,
});

    int? id;
    String? name;
    String? username;
    dynamic? uid;
    String? email;
    String? phoneNo;
    String? otp;
    int? role;
    dynamic? platform;
    int? isVerified;
    DateTime? expiresAt;
    dynamic? emailVerifiedAt;
    DateTime? createdAt;
    DateTime ?updatedAt;
    UserProfile? userProfile;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        uid: json["uid"],
        email: json["email"],
        phoneNo: json["phone_no"],
        otp: json["otp"],
        role: json["role"],
        platform: json["platform"],
        isVerified: json["is_verified"],
        expiresAt: DateTime.parse(json["expires_at"]),
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userProfile: UserProfile.fromJson(json["user_profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "uid": uid,
        "email": email,
        "phone_no": phoneNo,
        "otp": otp,
        "role": role,
        "platform": platform,
        "is_verified": isVerified,
        "expires_at": expiresAt!.toIso8601String(),
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user_profile": userProfile!.toJson(),
    };
}

class UserProfile {
    UserProfile({
        required this.id,
        required this.userId,
        required this.address,
        required this.businessType,
        required this.avatar,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int userId;
    String address;
    String businessType;
    String avatar;
    DateTime createdAt;
    DateTime updatedAt;

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        userId: json["user_id"],
        address: json["address"],
        businessType: json["business_type"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address": address,
        "business_type": businessType,
        "avatar": avatar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
