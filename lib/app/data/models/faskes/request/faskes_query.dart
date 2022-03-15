class FaskesQuery {
  FaskesQuery({
      this.query, 
      this.page, 
      this.perPage,});

  FaskesQuery.fromJson(dynamic json) {
    query = json['query'];
    page = json['page'];
    perPage = json['perPage'];
  }
  String? query;
  int? page;
  int? perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['query'] = "$query";
    map['page'] = "$page";
    map['perPage'] = "$perPage";
    return map;
  }

}