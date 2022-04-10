class Antropometri {
  Antropometri({
      this.month, 
      this.minus3SD, 
      this.minus2SD, 
      this.minus1SD, 
      this.median, 
      this.plus1SD, 
      this.plus2SD, 
      this.plus3SD,});

  Antropometri.fromJson(dynamic json) {
    month = json['month'];
    minus3SD = json['minus3SD'];
    minus2SD = json['minus2SD'];
    minus1SD = json['minus1SD'];
    median = json['median'];
    plus1SD = json['plus1SD'];
    plus2SD = json['plus2SD'];
    plus3SD = json['plus3SD'];
  }
  int? month;
  double? minus3SD;
  double? minus2SD;
  double? minus1SD;
  double? median;
  double? plus1SD;
  double? plus2SD;
  double? plus3SD;
Antropometri copyWith({  int? month,
  double? minus3SD,
  double? minus2SD,
  double? minus1SD,
  double? median,
  double? plus1SD,
  double? plus2SD,
  double? plus3SD,
}) => Antropometri(  month: month ?? this.month,
  minus3SD: minus3SD ?? this.minus3SD,
  minus2SD: minus2SD ?? this.minus2SD,
  minus1SD: minus1SD ?? this.minus1SD,
  median: median ?? this.median,
  plus1SD: plus1SD ?? this.plus1SD,
  plus2SD: plus2SD ?? this.plus2SD,
  plus3SD: plus3SD ?? this.plus3SD,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['minus3SD'] = minus3SD;
    map['minus2SD'] = minus2SD;
    map['minus1SD'] = minus1SD;
    map['median'] = median;
    map['plus1SD'] = plus1SD;
    map['plus2SD'] = plus2SD;
    map['plus3SD'] = plus3SD;
    return map;
  }

}