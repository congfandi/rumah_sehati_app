class Rekomendasi {
  Rekomendasi({
      this.perkembangan, 
      this.rekomendasiGizi, 
      this.rekomendasiJadwalKonsultasi, 
      this.halhalYangTidakbolehDanBolehDilakukan,});

  Rekomendasi.fromJson(dynamic json) {
    perkembangan = json['perkembangan'];
    rekomendasiGizi = json['rekomendasiGizi'];
    rekomendasiJadwalKonsultasi = json['rekomendasiJadwalKonsultasi'];
    halhalYangTidakbolehDanBolehDilakukan = json['halhalYangTidakbolehDanBolehDilakukan'];
  }
  String? perkembangan;
  String? rekomendasiGizi;
  String? rekomendasiJadwalKonsultasi;
  String? halhalYangTidakbolehDanBolehDilakukan;
Rekomendasi copyWith({  String? perkembangan,
  String? rekomendasiGizi,
  String? rekomendasiJadwalKonsultasi,
  String? halhalYangTidakbolehDanBolehDilakukan,
}) => Rekomendasi(  perkembangan: perkembangan ?? this.perkembangan,
  rekomendasiGizi: rekomendasiGizi ?? this.rekomendasiGizi,
  rekomendasiJadwalKonsultasi: rekomendasiJadwalKonsultasi ?? this.rekomendasiJadwalKonsultasi,
  halhalYangTidakbolehDanBolehDilakukan: halhalYangTidakbolehDanBolehDilakukan ?? this.halhalYangTidakbolehDanBolehDilakukan,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['perkembangan'] = perkembangan;
    map['rekomendasiGizi'] = rekomendasiGizi;
    map['rekomendasiJadwalKonsultasi'] = rekomendasiJadwalKonsultasi;
    map['halhalYangTidakbolehDanBolehDilakukan'] = halhalYangTidakbolehDanBolehDilakukan;
    return map;
  }

}