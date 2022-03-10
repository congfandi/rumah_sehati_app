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
    return Container(
      decoration: BoxDecoration(
          color: Pallet.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Pallet.grey)),
      padding: EdgeInsets.only(
          left: Dimension.width8,
          right: Dimension.width8,
          top: Dimension.height8,
          bottom: Dimension.height2),
      height: Dimension.height60,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyles.captionModerateRegular(),
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    obscureText: !showText,
                    onChanged: onChanged,
                    readOnly: readOnly,
                    style: TextStyles.bodySmallRegular(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyles.bodySmallItalic(color: Pallet.grey),
                      hintText: hintText,
                    ),
                    keyboardType: inputType,
                  ),
                ),
              ],
            ),
          ),
          icon ?? const SizedBox(),
        ],
      ),
    );
  }
}
