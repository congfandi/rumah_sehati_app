/*
 * Rumah Sehati
 * group.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class Group {
  Group({
      this.id, 
      this.name, 
      this.link, 
      this.cover, 
      this.description,});

  Group.fromJson(dynamic json) {
    id = int.parse(json["id"]);
    name = json['name'];
    link = json['link'];
    cover = json['cover'];
    description = json['description'];
  }
  int? id;
  String? name;
  String? link;
  String? cover;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['link'] = link;
    map['cover'] = cover;
    map['description'] = description;
    return map;
  }

}