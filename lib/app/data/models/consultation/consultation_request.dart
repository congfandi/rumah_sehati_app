class ConsultationRequest {
  ConsultationRequest({
      this.category, 
      this.question, 
      this.isAnonymous,});

  ConsultationRequest.fromJson(dynamic json) {
    category = json['category'];
    question = json['question'];
    isAnonymous = json['isAnonymous'];
  }
  String? category;
  String? question;
  bool? isAnonymous;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['question'] = question;
    map['isAnonymous'] = isAnonymous;
    return map;
  }

}