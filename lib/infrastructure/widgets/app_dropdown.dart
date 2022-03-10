/*
 * Rumah Sehati
 * app_dropdown.dart
 * Created by Cong Fandi on 4/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.options,
      this.label = ""})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;
  final List<String> options;

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
                    readOnly: true,
                    style: TextStyles.bodySmallRegular(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyles.bodySmallItalic(color: Pallet.grey),
                      hintText: hintText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showOption(context);
            },
            child: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Pallet.primaryPurple,
            ),
          )
        ],
      ),
    );
  }

  _showOption(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  options.length,
                  (index) => GestureDetector(
                        onTap: () {
                          controller.text = options[index];
                          Get.back();
                        },
                        child: ListTile(
                          title: Text(options[index]),
                        ),
                      )),
            ),
          );
        });
  }
}
