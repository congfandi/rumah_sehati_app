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
    this.height,
    this.weight,
    this.condition,
  });

  Profile.fromJson(dynamic json) {
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    birthDate = json['birthDate'];
    height = json['height'];
    weight = json['weight'];
    condition = json['condition'];
    photo = json['photo'];
  }

  String? phone;
  String? email;
  String? name;
  String? birthDate;
  int? height;
  int? weight;
  String? condition;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['name'] = name;
    map['birthDate'] = birthDate;
    map['height'] = height;
    map['weight'] = weight;
    map['condition'] = condition;
    map['photo'] = photo;
    return map;
  }
}
