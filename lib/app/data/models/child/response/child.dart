/*
 * Rumah Sehati
 * child.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:hive/hive.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/perkembangan.dart';
import 'package:rumah_sehati_mobile/app/data/models/kms/kms.dart';

part 'child.g.dart';

@HiveType(typeId: 2)
class Child {
  Child(
      {this.id,
      this.fullName,
      this.birthDate,
      this.gender,
      this.motherName,
      this.fatherName,
      this.fatherBirthday,
      this.motherBirthday,
      this.photo,
      this.perkembangan});

  Child.fromJson(dynamic json) {
    id = json["id"];
    fullName = json['childname'];
    birthDate = json['birthdate'];
    gender = json['gender'];
    motherName = json['mothername'];
    fatherName = json['fathername'];
    fatherBirthday = json['fatherbirthday'];
    motherBirthday = json['motherbirthday'];
    photo = json['photo'];
    perkembangan = json['perkembangan'] != null
        ? List<Perkembangan>.from(
            json['perkembangan'].map((x) => Perkembangan.fromJson(x)))
        : null;
  }

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? fullName;
  @HiveField(2)
  String? birthDate;
  @HiveField(3)
  String? gender;
  @HiveField(4)
  String? motherName;
  @HiveField(5)
  String? fatherName;
  @HiveField(6)
  String? fatherBirthday;
  @HiveField(7)
  String? motherBirthday;
  @HiveField(8)
  String? photo;
  @HiveField(9)
  List<Perkembangan>? perkembangan;

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
    map['photo'] = photo;
    if (perkembangan != null) {
      map['perkembangan'] = perkembangan?.map((x) => x.toJson()).toList();
    }
    return map;
  }
}
