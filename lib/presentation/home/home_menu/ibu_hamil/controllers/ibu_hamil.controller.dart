import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

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
    showDialog(
        context: Get.context!,
        builder: (c) => AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              content: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallet.white),
                padding: const EdgeInsets.all(14),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                          child: Text(
                        Strings.pregnantMom,
                        style: TextStyles.titleLarge(color: Pallet.lightBlack),
                      )),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(CupertinoIcons.clear_circled,
                            color: Pallet.lightBlack),
                      )
                    ]),
                    SizedBox(
                      height: Dimension.height24,
                    ),
                    Text(
                      Strings.bornPrediction,
                      style:
                          TextStyles.bodySmallMedium(color: Pallet.lightBlack),
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Text(
                      bornPrediction(),
                      style: TextStyles.titleLarge(color: Pallet.primaryPurple),
                    ),
                    Image.asset(
                      Assets.baby,
                      width: Dimension.width169,
                      height: Dimension.width169,
                    ),
                    Text(
                      "Usia kehamilan bunda : \n${getTrimester1()}\n${getTrimester2()}\n${getTrimester3()}",
                      style: TextStyles.captionModerateRegular(),
                    )
                  ]),
                ),
              ),
            ));
  }
}
