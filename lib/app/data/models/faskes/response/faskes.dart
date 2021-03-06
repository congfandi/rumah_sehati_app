/*
 * Rumah Sehati
 * faskes.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class Faskes {
  Faskes({
      this.id, 
      this.name, 
      this.latitude, 
      this.longitude, 
      this.cover,this.address,this.contact});

  Faskes.fromJson(dynamic json) {
    id =json["id"];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cover = json['cover'];
    address = json['address'];
    contact = json['contact'];
  }
  String? id;
  String? name;
  String? latitude;
  String? longitude;
  String? cover;
  String? address;
  String? contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['cover'] = cover;
    map['address'] = address;
    map['contact'] = contact;
    return map;
  }

}