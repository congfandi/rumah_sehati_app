import '../../profile/response/profile.dart';

class AuthResponse {
  AuthResponse({
    this.token,
    this.profile,});

  AuthResponse.fromJson(dynamic json) {
    token = json['token'];
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  String? token;
  Profile? profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    return map;
  }

}