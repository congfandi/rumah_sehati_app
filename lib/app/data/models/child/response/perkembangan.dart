import 'package:hive/hive.dart';

part 'perkembangan.g.dart';

@HiveType(typeId: 3)
class Perkembangan {
  Perkembangan({
    this.weight,
    this.height,
    this.measuringDate,
  });

  Perkembangan.fromJson(dynamic json) {
    weight = json['weight'];
    height = json['height'];
    measuringDate = json['measuringDate'];
  }

  @HiveField(0)
  double? weight;
  @HiveField(1)
  double? height;
  @HiveField(2)
  String? measuringDate;

  Perkembangan copyWith({
    double? weight,
    double? height,
    String? measuringDate,
  }) =>
      Perkembangan(
        weight: weight ?? this.weight,
        height: height ?? this.height,
        measuringDate: measuringDate ?? this.measuringDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['weight'] = weight;
    map['height'] = height;
    map['measuringDate'] = measuringDate;
    return map;
  }
}
