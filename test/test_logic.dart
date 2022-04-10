import 'package:flutter_test/flutter_test.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';

void main(){
 String tanggal = "01 April 2022";
 test("test tanggal", (){
   expect(tanggal.toParameter(), "2022-04-01");
 });
}