import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/menu.harian/menu_harian_request.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_normal_button.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/controllers/menu_harian.controller.dart';

// ignore: must_be_immutable
class MenuFilter extends GetView<MenuHarianController> {
  MenuFilter({Key? key}) : super(key: key);
  final List<String> category = [
    "Bayi dan balita",
    "Ibu Hamil",
    "Ibu menyusui"
  ];
  final List<String> categoryBayi = ["Gizi Kurang", "Normal", "Obesitas"];

  final List<String> categoryIbuHamil = [
    "Trimester 1",
    "Trimester 2",
    "Trimester 3"
  ];

  final List<String> subcategory = [
    "Usia 0-12 Bulan",
    "Usia 13-24 Bulan",
    "Usia 25-36 Bulan",
    "Usia 37-48 Bulan",
    "Usia 49-60 Bulan",
  ];

  RxString selectedCategory = RxString("Bayi dan balita");
  RxString selectedSubCategory = RxString("Gizi Kurang");
  RxString selectedUsia = RxString("Usia 0-12 Bulan");

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: "Filter",
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  _category(),
                  const SizedBox(height: 16),
                  _subCategory(),
                  const SizedBox(height: 16),
                  _usia(),
                ],
              )),
              AppNormalButton(
                  onPress: () {
                    _filter();
                  },
                  title: "Filter")
            ],
          ),
        ));
  }

  void _filter() {
    MenuHarianRequest query = controller.query;
    query.category = selectedCategory.value;
    query.usia = selectedUsia.value == "Usia 0-12 Bulan"
        ? 12
        : selectedUsia.value == "Usia 13-24 Bulan"
            ? 24
            : selectedUsia.value == "Usia 25-36 Bulan"
                ? 36
                : selectedUsia.value == "Usia 37-48 Bulan"
                    ? 48
                    : selectedUsia.value == "Usia 49-60 Bulan"
                        ? 60
                        : 0;
    controller.filter(query);
    Get.back();
  }

  Widget _category() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pilih Kategory"),
        Obx(
          () => DropdownButton<String>(
            items: category
                .map((String item) =>
                    DropdownMenuItem<String>(child: Text(item), value: item))
                .toList(),
            onChanged: (value) {
              selectedCategory(value);
              selectedSubCategory(value == category.first
                  ? categoryBayi.first
                  : categoryIbuHamil.first);
            },
            hint: const Text("Pilih Kategori"),
            isExpanded: true,
            value: selectedCategory.value,
          ),
        ),
      ],
    );
  }

  Widget _subCategory() {
    return Obx(
      () => selectedCategory.value == category.last
          ? const SizedBox()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Pilih Sub Kategory"),
                DropdownButton<String>(
                  items: (selectedCategory.value == category.first
                          ? categoryBayi
                          : categoryIbuHamil)
                      .map((String item) => DropdownMenuItem<String>(
                          child: Text(item), value: item))
                      .toList(),
                  onChanged: (value) {
                    selectedSubCategory(value);
                  },
                  hint: const Text("Pilih Sub Kategori"),
                  isExpanded: true,
                  value: selectedSubCategory.value,
                )
              ],
            ),
    );
  }

  Widget _usia() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pilih Usia"),
        Obx(
          () => DropdownButton<String>(
            items: subcategory
                .map((String item) =>
                    DropdownMenuItem<String>(child: Text(item), value: item))
                .toList(),
            onChanged: (value) {
              selectedUsia(value);
            },
            hint: const Text("Pilih Usia"),
            isExpanded: true,
            value: selectedUsia.value,
          ),
        ),
      ],
    );
  }
}
