import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';


class CalculatorInput extends StatelessWidget {
  const CalculatorInput(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hint,
      required this.uom})
      : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hint;
  final String uom;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(title, style: TextStyles.bodySmallMedium()),
      SizedBox(
        height: Dimension.height8,
      ),
      Container(
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
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controller,
                decoration:
                    InputDecoration(hintText: hint, border: InputBorder.none),
              ),
            ),
            const Text("|"),
            SizedBox(
              width: Dimension.width36,
              child: Text(
                uom,
                textAlign: TextAlign.end,
                style: TextStyles.captionModerateSemiBold(
                    color: Pallet.primaryPurple),
              ),
            )
          ],
        ),
      )
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }
}
