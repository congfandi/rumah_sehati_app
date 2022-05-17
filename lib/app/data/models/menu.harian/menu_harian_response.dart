class MenuHarian {
  MenuHarian({
    this.id,
    this.title,
    this.author,
    this.content,
    this.category,
    this.tags,
    this.umur,
    this.link,
    this.cover,
    this.linkVideo,
    this.createdDate,
  });

  MenuHarian.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    content = json['content'];
    category = json['category'];
    tags = json['tags'];
    umur = json['umur'];
    link = json['link'];
    cover = json['cover'];
    linkVideo = json['linkVideo'];
    createdDate = json['createdDate'];
  }

  String? id;
  String? title;
  String? author;
  String? content;
  String? category;
  String? tags;
  String? umur;
  String? link;
  String? cover;
  String? linkVideo;
  String? createdDate;

  MenuHarian copyWith({
    String? id,
    String? title,
    String? author,
    String? content,
    String? category,
    String? tags,
    String? umur,
    String? link,
    String? cover,
    String? linkVideo,
    String? createdDate,
  }) =>
      MenuHarian(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        content: content ?? this.content,
        category: category ?? this.category,
        tags: tags ?? this.tags,
        umur: umur ?? this.umur,
        link: link ?? this.link,
        cover: cover ?? this.cover,
        linkVideo: linkVideo ?? this.linkVideo,
        createdDate: createdDate ?? this.createdDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['author'] = author;
    map['content'] = content;
    map['category'] = category;
    map['tags'] = tags;
    map['umur'] = umur;
    map['link'] = link;
    map['cover'] = cover;
    map['linkVideo'] = linkVideo;
    map['createdDate'] = createdDate;
    return map;
  }
}
