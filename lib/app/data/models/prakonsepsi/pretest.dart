class Pretest {
  Pretest({
      this.preTest, 
      this.postTest,});

  Pretest.fromJson(dynamic json) {
    preTest = json['preTest'];
    postTest = json['postTest'];
  }
  String? preTest;
  String? postTest;
Pretest copyWith({  String? preTest,
  String? postTest,
}) => Pretest(  preTest: preTest ?? this.preTest,
  postTest: postTest ?? this.postTest,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['preTest'] = preTest;
    map['postTest'] = postTest;
    return map;
  }

}