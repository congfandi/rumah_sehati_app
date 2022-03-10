/*
 * byggtid_mobile_app
 * list_print.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

extension MapPrint on Map {
  String getAllString() {
    String result = "";
    forEach((key, value) {
      result += "$key : $value\n";
    });
    return result;
  }
}

extension ListPrint on List {
  String getAllList() {
    String result = "";
    forEach((element) {
      result += element;
      if (element != last) {
        result += ", ";
      }
    });
    return result;
  }
}
