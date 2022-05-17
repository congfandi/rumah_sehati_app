import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/controllers/menu_harian.controller.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/menu.filter.dart';

class MenuSearch extends GetView<MenuHarianController> {
  const MenuSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(child: _jenisMakanan()),
          IconButton(
              onPressed: () {
                Get.to(() => MenuFilter());
              },
              icon: const Icon(Icons.filter_alt))
        ],
      ),
    );
  }

  Widget _jenisMakanan() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pilih Jenis Makanan"),
        Obx(
          () => DropdownButton<String>(
            items: controller.jenisMakanan
                .map((String item) =>
                    DropdownMenuItem<String>(child: Text(item), value: item))
                .toList(),
            onChanged: (value) {
              controller.changeJenisMakanan(value!);
            },
            hint: const Text("Pilih Jenis Makanan"),
            isExpanded: true,
            value: controller.selectedJenisMakanan.value,
          ),
        ),
      ],
    );
  }
}
