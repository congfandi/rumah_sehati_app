import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppAppbar extends StatelessWidget {
  const AppAppbar({Key? key, required this.title, this.showBackButton = true})
      : super(key: key);
  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Pallet.primaryPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      width: Get.width,
      height: Dimension.height120,
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              children: [
                showBackButton
                    ? IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Pallet.white,
                          size: 32,
                        ),
                      )
                    : SizedBox(
                        width: Dimension.width36,
                      ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.titleLarge(color: Pallet.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: Dimension.width36,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
