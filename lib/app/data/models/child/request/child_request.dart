class ChildRequest {
  ChildRequest({
      this.fullName, 
      this.birthDate, 
      this.gender, 
      this.motherName, 
      this.fatherName, 
      this.fatherBirthday, 
      this.motherBirthday, 
      this.height, 
      this.weight, 
      this.measuringDate,});

  ChildRequest.fromJson(dynamic json) {
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
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    return map;
  }

}