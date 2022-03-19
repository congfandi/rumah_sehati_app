class Consultation {
  Consultation({
      this.id, 
      this.answer, 
      this.link, 
      this.category, 
      this.createdDate, 
      this.questioner, 
      this.answeredBy, 
      this.question,});

  Consultation.fromJson(dynamic json) {
    id = int.parse(json["id"]);
    answer = json['answer'];
    link = json['link'];
    category = json['category'];
    createdDate = json['createdDate'];
    questioner = json['questioner'] != null ? Questioner.fromJson(json['questioner']) : null;
    answeredBy = json['answeredBy'];
    question = json['question'];
  }
  int? id;
  String? answer;
  String? link;
  String? category;
  String? createdDate;
  Questioner? questioner;
  String? answeredBy;
  String? question;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['answer'] = answer;
    map['link'] = link;
    map['category'] = category;
    map['createdDate'] = createdDate;
    if (questioner != null) {
      map['questioner'] = questioner?.toJson();
    }
    map['answeredBy'] = answeredBy;
    map['question'] = question;
    return map;
  }

}

class Questioner {
  Questioner({
      this.photo, 
      this.name,});

  Questioner.fromJson(dynamic json) {
    photo = json['photo'];
    name = json['name'];
  }
  String? photo;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = photo;
    map['name'] = name;
    return map;
  }

}