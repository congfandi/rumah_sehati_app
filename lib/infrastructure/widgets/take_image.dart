import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class TakeImage {
  final Function(XFile?) onPicked;

  TakeImage({required this.onPicked}) {
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.transparent,
        builder: (c) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Pallet.white),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pilih Sumber",
                  style: TextStyles.titleHero(),
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Get.back();
                      _takeImage(false);
                    },
                    child: Text(
                      "Camera",
                      style: TextStyles.moderateSemiBold(),
                    )),
                const Divider(),
                TextButton(
                    onPressed: () {
                      Get.back();
                      _takeImage(true);
                    },
                    child: Text(
                      "Gallery",
                      style: TextStyles.moderateSemiBold(),
                    )),
              ],
            ),
          );
        });
  }

  void _takeImage(bool isGallery) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera,imageQuality: 50);
    onPicked(image);
  }
}
