import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class CalculatorDatePicker extends StatelessWidget {
  const CalculatorDatePicker(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hint,
      required this.onSelectedDate,
      this.icon = const Icon(
        Icons.date_range,
        color: Pallet.primaryPurple,
      )})
      : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hint;
  final Widget icon;
  final Function(DateTime) onSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title, style: TextStyles.bodySmallMedium()),
      SizedBox(
        height: Dimension.height8,
      ),
      GestureDetector(
        onTap: () {
          openDialog();
        },
        child: Container(
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
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controller,
                  decoration:
                      InputDecoration(hintText: hint, border: InputBorder.none),
                  onTap: () {
                    openDialog();
                  },
                ),
              ),
              SizedBox(
                width: Dimension.width36,
                child: icon,
              )
            ],
          ),
        ),
      )
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }

  void openDialog() async {
    DateTime? selectedDate = await showDatePicker(
        context: Get.context!,
        locale: const Locale('id', 'ID'),
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 2000)),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      controller.text =
          DateFormat("dd MMMM yyyy", "id_ID").format(selectedDate);
      onSelectedDate(selectedDate);
    }
  }
}
