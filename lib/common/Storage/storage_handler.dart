import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageHandler extends GetxController {
  final box = GetStorage();

  setToken(String token) {
    var result = box.write('token', token);
  }

  setDeviceID(String token) {
    var result = box.write('deviceId', token);
  }

  setFCM(String token) {
    var result = box.write('fcm', token);
  }

  setUserData(Map<String, dynamic> myData) {
    String rawJson = jsonEncode(myData);
    print(rawJson);
    box.write('user', rawJson);
  }

  getToken() {
    return box.read('token');
  }

  getFCM() {
    var result = box.read('fcm');

    return result;
  }

  getDeviceID() {
    var result = box.read('deviceId');

    return result;
  }

  getUserData() {
    final response = box.read('user');
    return response != null ? jsonDecode(response) : null;
  }

  removeToken() {
    box.remove('token');
  }

  removeDeviceID() {
    box.remove('deviceId');
  }

  removeFCM() {
    box.remove('fcm');
  }

  removeCMS() {
    box.remove('cms');
  }

  removeCache() async {
    await removeCMS();

    await removeFCM();
    await removeToken();
    await removeDeviceID();
    await removeUserData();
  }

  removeUserData() {
    box.remove('user');
  }
}