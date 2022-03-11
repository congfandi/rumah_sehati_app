import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../infrastructure/base/base_ui.dart';
import '../../../../infrastructure/theme/theme.dart';
import '../../../../infrastructure/utils/resources/resources.dart';
import '../tips_item.dart';
import 'controllers/prakonsepsi.controller.dart';

class PrakonsepsiScreen extends GetView<PrakonsepsiController> {
  const PrakonsepsiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: Strings.prakonsepsi,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _search(),
            Expanded(
                child: ListView.builder(
              itemBuilder: (c, i) => const TipsItem(),
              itemCount: 8,
            ))
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      decoration: BoxDecoration(
          color: Pallet.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 20,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: Strings.inputKey, border: InputBorder.none),
            ),
          ),
          const Icon(
            Icons.search,
            color: Pallet.primaryPurple,
          )
        ],
      ),
    );
  }
}
