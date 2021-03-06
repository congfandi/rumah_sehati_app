/*
 * Rumah Sehati
 * article_request.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

class ArticleRequest {
  ArticleRequest({
    this.category,
    this.tags,
    this.query,
    this.page,
    this.perPage,
  });

  ArticleRequest.fromJson(dynamic json) {
    category = json['category'];
    tags = json['tags'];
    query = json['query'];
    page = json['page'];
    perPage = json['perPage'];
  }

  String? category;
  String? tags;
  String? query;
  int? page;
  int? perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (category != null && category != "") {
      map['category'] = category;
    }
    if (query != null) {
      map['query'] = query;
    }
    if (page != null) {
      map['page'] = "$page";
    }
    if (perPage != null) {
      map['perPage'] = "$perPage";
    }
    if (tags != null) {
      map['tags'] = "$tags";
    }
    return map;
  }
}
