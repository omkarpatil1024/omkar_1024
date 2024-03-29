import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/values/constant.dart';

import '../entities/user.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool getDeviceFirsrOpen() {
    return _pref.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLogedIn() {
    return _pref.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  String getUserToken() {
    return _pref.getString(AppConstant.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  UserItem? getUserProfile() {
    var profileOffline =
        _pref.getString(AppConstant.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return null;
  }

  Future<bool> remove(String key) {
    return _pref.remove(key);
  }
}
