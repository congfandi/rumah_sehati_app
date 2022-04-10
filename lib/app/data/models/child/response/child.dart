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
    id = json["id"];
    fullName = json['childname'];
    birthDate = json['birthdate'];
    gender = json['gender'];
    motherName = json['mothername'];
    fatherName = json['fathername'];
    fatherBirthday = json['fatherbirthday'];
    motherBirthday = json['motherbirthday'];
    height = json['height'];
    weight = json['weight'];
    measuringDate = json['measuringdate'];
    photo = json['photo'];
  }

  String? id;
  String? fullName;
  String? birthDate;
  String? gender;
  String? motherName;
  String? fatherName;
  String? fatherBirthday;
  String? motherBirthday;
  String? height;
  String? weight;
  String? measuringDate;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['childname'] = fullName;
    map['birthdate'] = birthDate;
    map['gender'] = gender;
    map['mothername'] = motherName;
    map['fathername'] = fatherName;
    map['fatherbirthday'] = fatherBirthday;
    map['motherbirthday'] = motherBirthday;
    map['height'] = height;
    map['weight'] = weight;
    map['measuringdate'] = measuringDate;
    map['photo'] = photo;
    return map;
  }
}
