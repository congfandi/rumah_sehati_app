/*
 * Rumah Sehati
 * base_response.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */


import 'article/response/article.dart';
import 'child/response/child.dart';
import 'faskes/response/faskes.dart';
import 'group/response/group.dart';
import 'meta.dart';
import 'profile/response/profile.dart';

class BaseResponse {
  BaseResponse({
    this.statusCode,
    this.message,
    this.result,
  });

  BaseResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    result = json['result'] != null ? ResultResponse.fromJson(json['result']) : null;
  }

  int? statusCode;
  String? message;
  ResultResponse? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['result'] = result;
    return map;
  }
}

class ResultResponse {
  String? token;
  Profile? profile;
  List<Article>? articles;
  Meta? meta;
  Faskes? faskes;
  List<Group>? groups;
  List<Child>? children;

  ResultResponse.fromJson(dynamic json) {
    token = json['token'];
    profile =
        json['profile'] == null ? null : Profile.fromJson(json['profile']);
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }

    meta = json['meta'] == null ? null : Meta.fromJson(json['meta']);

    faskes = json['faskes'] == null ? null : Faskes.fromJson(json['faskes']);

    if (json['groups'] != null) {
      groups = [];
      json['groups'].forEach((v) {
        groups?.add(Group.fromJson(v));
      });
    }

    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(Child.fromJson(v));
      });
    }
  }
}
