class QuestionerQuery {
  QuestionerQuery({
    this.category,
    this.query,
    this.page,
    this.perPage,
  });

  QuestionerQuery.fromJson(dynamic json) {
    category = json['category'];
    query = json['query'];
    page = json['page'];
    perPage = json['perPage'];
  }

  String? category;
  String? query;
  int? page;
  int? perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (category != null) {
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
    return map;
  }
}
