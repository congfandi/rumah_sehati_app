/*
 * Rumah Sehati
 * profile.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

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
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    birthDate = json['birthDate'];
    condition = json['condition'];
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
    map['birthDate'] = birthDate;
    map['condition'] = condition;
    map['photo'] = photo;
    map['password'] = password;
    return map;
  }
}
