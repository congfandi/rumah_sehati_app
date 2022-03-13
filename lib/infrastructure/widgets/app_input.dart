import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppInput extends StatelessWidget {
  const AppInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.icon,
      this.label = "",
      this.onChanged,
      this.inputType = TextInputType.text,
      this.readOnly = false,
      this.showText = true})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;
  final Widget? icon;
  final bool showText;
  final bool readOnly;
  final Function(String)? onChanged;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(label, style: TextStyles.bodySmallMedium()),
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
        child: TextFormField(
          keyboardType: inputType,
          controller: controller,
          readOnly: readOnly,
          obscureText: !showText,
          decoration:
              InputDecoration(hintText: hintText, border: InputBorder.none),
        ),
      )
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }
}
