/*
 * Rumah Sehati
 * child.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class Child {
  Child({
    this.id,
    this.fullName,
    this.birthDate,
    this.gender,
    this.motherName,
    this.fatherName,
    this.fatherBirthday,
    this.motherBirthday,
    this.height,
    this.weight,
    this.photo,
    this.measuringDate,
  });

  Child.fromJson(dynamic json) {
    id = int.parse(json["id"]);
    fullName = json['fullName'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    motherName = json['motherName'];
    fatherName = json['fatherName'];
    fatherBirthday = json['fatherBirthday'];
    motherBirthday = json['motherBirthday'];
    height = json['height'];
    weight = json['weight'];
    measuringDate = json['measuringDate'];
    photo = json['photo'];
  }

  int? id;
  String? fullName;
  String? birthDate;
  String? gender;
  String? motherName;
  String? fatherName;
  String? fatherBirthday;
  String? motherBirthday;
  double? height;
  double? weight;
  String? measuringDate;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['birthDate'] = birthDate;
    map['gender'] = gender;
    map['motherName'] = motherName;
    map['fatherName'] = fatherName;
    map['fatherBirthday'] = fatherBirthday;
    map['motherBirthday'] = motherBirthday;
    map['height'] = height;
    map['weight'] = weight;
    map['measuringDate'] = measuringDate;
    map['photo'] = photo;
    return map;
  }
}
