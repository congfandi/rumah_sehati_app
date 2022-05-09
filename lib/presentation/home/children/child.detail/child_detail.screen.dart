import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_input.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/child.detail/child.description.dart';

import 'controllers/child_detail.controller.dart';

class ChildDetailScreen extends GetView<ChildDetailController> {
  const ChildDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: "Perkembangan Anak",
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addDataPosyandu();
        },
        child: const Icon(Icons.add),
        tooltip: 'Tambah Data',
      ),
      child: const ChildDescription(),
    );
  }

  void _addDataPosyandu() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Tambah Data Perkembangan anak",
                    style: TextStyles.moderateSemiBold()),
                SizedBox(
                  height: Dimension.height16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(Get.context!).viewInsets.bottom),
                        child: CalculatorInput(
                            controller: controller.height,
                            title: Strings.tinggiBadan,
                            hint: "XXX",
                            uom: "Cm"),
                      ),
                    ),
                    SizedBox(
                      width: Dimension.width8,
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(Get.context!).viewInsets.bottom),
                      child: CalculatorInput(
                          controller: controller.weight,
                          title: Strings.weightBody,
                          hint: "XXX",
                          uom: "Kg"),
                    ))
                  ],
                ),
                SizedBox(
                  height: Dimension.height16,
                ),
                CalculatorDatePicker(
                    controller: controller.posyanduDate,
                    title: Strings.dateUkur,
                    hint: Strings.datePengukuran,
                    onSelectedDate: (date) {
                      controller.posyanduDateSelected = date;
                    }),
                SizedBox(
                  height: Dimension.height32,
                ),
                AppNormalButton(
                    onPress: () {
                      controller.savePerkembangan();
                    },
                    title: "Save Data"),
                SizedBox(
                  height: Dimension.height32,
                ),
              ],
            ),
          );
        },
        isScrollControlled: true);
  }
}
