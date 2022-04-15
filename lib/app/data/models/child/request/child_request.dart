class ChildRequest {
  ChildRequest(
      {this.fullName,
      this.birthDate,
      this.gender,
      this.motherName,
      this.fatherName,
      this.fatherBirthday,
      this.motherBirthday,
      this.height,
      this.weight,
      this.measuringDate,
      this.photo,
      });

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
  String? id;
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
    if (fullName != null) {
      map['fullName'] = fullName;
    }
    if (birthDate != null) {
      map['birthDate'] = birthDate;
    }
    if (gender != null) {
      map['gender'] = gender;
    }
    if (motherName != null) {
      map['motherName'] = motherName;
    }
    if (fatherName != null) {
      map['fatherName'] = fatherName;
    }
    if (fatherBirthday != null) {
      map['fatherBirthday'] = fatherBirthday;
    }
    if (motherBirthday != null) {
      map['motherBirthday'] = motherBirthday;
    }
    if (height != null) {
      map['height'] = height;
    }
    if (height != null) {
      map['weight'] = weight;
    }
    if (measuringDate != null) {
      map['measuringDate'] = measuringDate;
    }
    if (photo != null) {
      map['photo'] = photo;
    }
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
