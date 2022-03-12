import 'package:intl/intl.dart';

extension StringExtension on String {
  String toDayAndDate() {
    DateTime date = DateFormat("dd/MM/yyyy").parse(this);
    return DateFormat("EEEE,dd MMMM yyyy", "id_ID").format(date);
  }
}
