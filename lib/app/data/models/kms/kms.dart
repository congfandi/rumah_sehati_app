import 'package:hive/hive.dart';

part 'kms.g.dart';

@HiveType(typeId: 1)
class Kms {
  Kms(
      {this.gender,
      this.birthDate,
      this.posyanduDate,
      this.weight,
      this.asi,
      this.createdAt});

  Kms.fromJson(dynamic json) {
    gender = json['gender'];
    birthDate = json['birthDate'];
    posyanduDate = json['posyanduDate'];
    weight = json['weight'];
    asi = json['asi'];
    createdAt = json['createdAt'];
  }

  @HiveField(0)
  String? gender;
  @HiveField(1)
  String? birthDate;
  @HiveField(2)
  String? posyanduDate;
  @HiveField(3)
  double? weight;
  @HiveField(4)
  String? asi;
  @HiveField(5)
  String? createdAt;

  Kms copyWith(
          {String? gender,
          String? birthDate,
          String? posyanduDate,
          double? weight,
          String? asi,
          String? createdAt}) =>
      Kms(
          gender: gender ?? this.gender,
          birthDate: birthDate ?? this.birthDate,
          posyanduDate: posyanduDate ?? this.posyanduDate,
          weight: weight ?? this.weight,
          asi: asi ?? this.asi,
          createdAt: createdAt ?? this.createdAt);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = gender;
    map['birthDate'] = birthDate;
    map['posyanduDate'] = posyanduDate;
    map['weight'] = weight;
    map['asi'] = asi;
    map['createdAt'] = createdAt;
    return map;
  }
}
