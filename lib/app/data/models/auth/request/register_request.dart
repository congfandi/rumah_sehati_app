/*
 * Rumah Sehati
 * register_request.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class RegisterRequest {
  RegisterRequest({
      this.phone, 
      this.email, 
      this.name, 
      this.birthDate, 
      this.height, 
      this.weight, 
      this.condition, 
      this.photoProfile,});

  RegisterRequest.fromJson(dynamic json) {
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    birthDate = json['birthDate'];
    height = json['height'];
    weight = json['weight'];
    condition = json['condition'];
    photoProfile = json['photoProfile'];
  }
  String? phone;
  String? email;
  String? name;
  String? birthDate;
  int? height;
  int? weight;
  String? condition;
  String? photoProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['name'] = name;
    map['birthDate'] = birthDate;
    map['height'] = height;
    map['weight'] = weight;
    map['condition'] = condition;
    map['photoProfile'] = photoProfile;
    return map;
  }

}