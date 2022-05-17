class MenuHarianRequest {
  MenuHarianRequest({
    this.category,
    this.isSarapan,
    this.isMakanSiang,
    this.isMakanMalam,
    this.isSnack,
    this.page,
    this.perpage,
    this.usia,
    this.tipe,
  });

  MenuHarianRequest.fromJson(dynamic json) {
    category = json['category'];
    isSarapan = json['isSarapan'];
    isMakanSiang = json['isMakanSiang'];
    isMakanMalam = json['isMakanMalam'];
    isSnack = json['isSnack'];
    page = json['page'];
    perpage = json['perPage'];
    usia = json['usia'];
    tipe = json['tipe'];
  }

  String? category;
  bool? isSarapan;
  bool? isMakanSiang;
  bool? isMakanMalam;
  bool? isSnack;
  int? page;
  int? perpage;
  int? usia;
  String? tipe;

  MenuHarianRequest copyWith({
    String? category,
    bool? isSarapan,
    bool? isMakanSiang,
    bool? isMakanMalam,
    bool? isSnack,
    int? page,
    int? perpage,
    int? usia,
    String? tipe,
  }) =>
      MenuHarianRequest(
        category: category ?? this.category,
        isSarapan: isSarapan ?? this.isSarapan,
        isMakanSiang: isMakanSiang ?? this.isMakanSiang,
        isMakanMalam: isMakanMalam ?? this.isMakanMalam,
        isSnack: isSnack ?? this.isSnack,
        page: page ?? this.page,
        perpage: perpage ?? this.perpage,
        usia: usia ?? this.usia,
        tipe: tipe ?? this.tipe,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['isSarapan'] = "true";
    map['isMakanSiang'] = "true";
    map['isMakanMalam'] = "true";
    map['isSnack'] = "true";
    map['page'] = "$page";
    map['perPage'] = "10";
    map['usia'] = "$usia";
    map['tipe'] = "normal";
    return map;
  }
}
