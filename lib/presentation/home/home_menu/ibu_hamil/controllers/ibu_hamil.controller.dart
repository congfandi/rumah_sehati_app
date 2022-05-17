import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';

class IbuHamilController extends GetxController {
  DateTime? firstDate;
  DateTime? lastDate;

  String getTrimester1() {
    DateTime? lastDate = firstDate?.add(const Duration(days: 90));
    return "- Trimester 1: " +
        DateFormat("dd MMM yyyy", "id_ID").format(firstDate!) +
        " - " +
        DateFormat("dd MMM yyyy", "id_ID").format(lastDate!);
  }

  String getTrimester2() {
    DateTime? triFirst = firstDate?.add(const Duration(days: 91));
    DateTime? triLast = triFirst?.add(const Duration(days: 90));
    return "- Trimester 2: " +
        DateFormat("dd MMM yyyy", "id_ID").format(triFirst!) +
        " - " +
        DateFormat("dd MMM yyyy", "id_ID").format(triLast!);
  }

  String getTrimester3() {
    DateTime? triFirst = firstDate?.add(const Duration(days: 182));
    DateTime? triLast = triFirst?.add(const Duration(days: 98));
    return "- Trimester 3: " +
        DateFormat("dd MMM yyyy", "id_ID").format(triFirst!) +
        " - " +
        DateFormat("dd MMM yyyy", "id_ID").format(triLast!);
  }

  String bornPrediction() {
    return DateFormat("dd MMMM yyyy", "id_ID")
        .format(firstDate!.add(const Duration(days: 280)));
  }

  void calculate() {
    Get.toNamed(Routes.DETAIL_IBU_HAMIL, arguments: [
      "Usia kehamilan bunda : \n${getTrimester1()}\n${getTrimester2()}\n${getTrimester3()}",
      bornPrediction()
    ]);
  }
}
