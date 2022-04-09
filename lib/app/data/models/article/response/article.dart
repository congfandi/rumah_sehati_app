/*
 * Rumah Sehati
 * article.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */
import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)
class Article {
  Article({
    this.id,
    this.title,
    this.cover,
    this.author,
    this.content,
    this.link,
    this.tags,
    this.createdDate,
    this.category
  });

  Article.fromJson(dynamic json) {
    id = int.parse(json["id"]);
    title = json['title'];
    cover = json['cover'];
    author = json['author'];
    content = json['content'];
    link = json['link'];
    tags = json['tags'] != null ? (json['tags'] as String).split(",") : [];
    createdDate = json['createdDate'];
    category = json['category'];
  }

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? cover;
  @HiveField(3)
  String? author;
  @HiveField(4)
  String? content;
  @HiveField(5)
  String? link;
  @HiveField(6)
  List<String>? tags;
  @HiveField(7)
  String? createdDate;
  @HiveField(8)
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['cover'] = cover;
    map['author'] = author;
    map['content'] = content;
    map['link'] = link;
    map['tags'] = tags;
    map['createdDate'] = createdDate;
    map['category'] = category;
    return map;
  }
}
