/*
 * Rumah Sehati
 * meta.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class Meta {
  Meta({
      this.currentPage, 
      this.totalPage,});

  Meta.fromJson(dynamic json) {
    currentPage = "${json['currentPage']}";
    totalPage = "${json['totalPage']}";
  }
  String? currentPage;
  String? totalPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['totalPage'] = totalPage;
    return map;
  }

}