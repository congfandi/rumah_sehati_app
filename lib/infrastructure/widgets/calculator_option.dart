import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class CalculatorOption extends StatelessWidget {
  const CalculatorOption(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hint,
      required this.options,
      this.icon = const Icon(
        Icons.keyboard_arrow_down,
        color: Pallet.primaryPurple,
      ),
      this.onSelect})
      : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hint;
  final Widget icon;
  final List<String> options;
  final Function(String)? onSelect;

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

  void openDialog() {
    showDialog(
        context: Get.context!,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Pallet.white),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options
                    .map((e) => GestureDetector(
                          onTap: () {
                            if (onSelect != null) {
                              onSelect!(e);
                            }
                            controller.text = e;
                            Get.back();
                          },
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e,
                                    style: TextStyles.bodySmallMedium(
                                        color: controller.text == e
                                            ? Pallet.primaryPurple
                                            : Pallet.jetBlack),
                                    textAlign: TextAlign.start,
                                  ),
                                  height: Dimension.height40,
                                  width: Get.width),
                              e == options.last
                                  ? const SizedBox()
                                  : Container(
                                      width: Get.width,
                                      height: 1,
                                      color: Pallet.lightBlack)
                            ],
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }
}
