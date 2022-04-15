/*
 * Rumah Sehati
 * profile.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/cupertino.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';

class Profile {
  Profile({
    this.phone,
    this.photo,
    this.email,
    this.name,
    this.birthDate,
    this.condition,
    this.password,
  });

  Profile.fromJson(dynamic json) {
    debugPrint("Profile.fromJson ${json.toString()}");
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    birthDate = json['birthdate'];
    condition = json['condition_mom'];
    photo = json['photo'];
  }

  String? phone;
  String? email;
  String? name;
  String? birthDate;
  String? condition;
  String? photo;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['name'] = name;
    map['birthdate'] = birthDate;
    map['condition_mom'] = condition;
    map['photo'] = photo;
    map['password'] = password;
    return map;
  }

  Map<String, dynamic> toRegister() {
    final map = <String, dynamic>{};
    if (phone != null) map['phone'] = phone;
    if (email != null) map['email'] = email;
    map['name'] = name;
    map['birthDate'] = birthDate?.toParameter();
    map['condition'] = condition;
    map['photo'] = photo;
    map['password'] = password;
    return map;
  }
}
