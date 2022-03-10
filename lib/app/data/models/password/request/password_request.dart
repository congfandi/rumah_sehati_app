/*
 * Rumah Sehati
 * password_request.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class PasswordRequest {
  PasswordRequest({
      this.oldPassword, 
      this.newPassword, 
      this.retypeNewPassword,});

  PasswordRequest.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    retypeNewPassword = json['retypeNewPassword'];
  }
  String? oldPassword;
  String? newPassword;
  String? retypeNewPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['newPassword'] = newPassword;
    map['retypeNewPassword'] = retypeNewPassword;
    return map;
  }

}