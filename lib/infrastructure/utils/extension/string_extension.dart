import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String toDayAndDate({String format = "dd/MM/yyyy"}) {
    DateTime date = DateFormat(format).parse(this);
    return DateFormat("EEEE,dd MMMM yyyy", "id_ID").format(date);
  }

  String ageBaby() {
    debugPrint("age baby this: $this");
    initializeDateFormatting();
    DateTime birthDate = DateFormat("yyyy-MM-dd","id_ID").parse(this);
    DateTime today = DateTime.now();
    int totalDay = today.difference(birthDate).inDays;
    int year = totalDay ~/ 360;
    int month = (totalDay ~/ 30) % 12;
    int days = totalDay % 7;
    return "$year tahun $month bulan $days hari";
  }

  String age() {
    DateTime birthDate = DateFormat("yyyy-MM-dd").parse(this);
    DateTime today = DateTime.now();
    int year = today.year - birthDate.year;
    return "$year";
  }

  DateTime toDate({String format = "yyyy-MM-dd"}) {
    return DateFormat(format).parse(this);
  }

  String toDateString({String format = "yyyy-MM-dd"}) {
    initializeDateFormatting();
    DateTime date = DateFormat(format).parse(this);
    return DateFormat("dd MMMM yyyy", "id_ID").format(date);
  }

  String toParameter(){
    initializeDateFormatting();
    DateTime date = DateFormat("dd MMMM yyyy","id_ID").parse(this);
    return DateFormat("yyyy-MM-dd").format(date);
  }
}
