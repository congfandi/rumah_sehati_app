/*
 * byggtid_mobile_app
 * pref_helper.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:get_storage/get_storage.dart';

import '../../../app/data/models/profile/response/profile.dart';

class PrefHelper {
  static final PrefHelper to = PrefHelper._singleTon();

  factory PrefHelper() {
    return to;
  }

  static final _storage = GetStorage();

  PrefHelper._singleTon();

  void saveToken({required String token}) {
    _storage.write("token", token);
  }

  String? getToken() {
    if (_storage.read("token") != null) return _storage.read("token");
    return null;
  }

  void removeAuth() {
    _storage.remove("token");
    _storage.remove("profile");
  }

  void saveProfile({required Profile profile}) {
    _storage.write("profile", profile.toJson());
  }

  Profile? getProfile() {
    Profile? profile;
    if (_storage.read("profile") != null) {
      profile = Profile.fromJson(_storage.read("profile"));
    }
    return profile;
  }

}
