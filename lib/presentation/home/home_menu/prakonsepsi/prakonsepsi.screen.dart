import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_normal_button.dart';

import '../../../../infrastructure/base/base_ui.dart';
import '../../../../infrastructure/theme/theme.dart';
import '../../../../infrastructure/utils/resources/resources.dart';
import 'controllers/prakonsepsi.controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PrakonsepsiScreen extends GetView<PrakonsepsiController> {
  const PrakonsepsiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: Strings.prakonsepsi,
      child: Obx(() => controller.isNeedLoading.isTrue
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_header(), _menu()],
              ),
            )),
      showBackButton: true,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.prakonsepsi,
            style: TextStyles.titleHero(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            Strings.prepairingPregnant,
            style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
          ),
          SizedBox(
            height: Dimension.height16,
          ),
          RichText(
              text: TextSpan(
                  text: "apa sih prakonsepsi itu?",
                  style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                  children: [
                TextSpan(
                  text: " Yuk kerjakan Pre Test",
                  style: TextStyles.bodySmallRegular().copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl(controller.pretestUrl);
                    },
                )
              ])),
          SizedBox(
            height: Dimension.height24,
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            "Memahami prakonsepsi",
            style: TextStyles.moderateSemiBold(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          AppNormalButton(
              onPress: () {
                Get.toNamed(Routes.DETAIL_PRAKONSEPSI, arguments: "1");
              },
              title: "Pemeriksaan prakonksepsi apa saja?"),
          SizedBox(
            height: Dimension.height8,
          ),
          AppNormalButton(
              onPress: () {
                Get.toNamed(Routes.DETAIL_PRAKONSEPSI, arguments: "2");
              },
              title: "langkah langkah yang dilakukan dalam prakonsepsi?"),
          SizedBox(
            height: Dimension.height8,
          ),
          AppNormalButton(
              onPress: () {
                Get.toNamed(Routes.DETAIL_PRAKONSEPSI, arguments: "3");
              },
              title: "Mengapa harus dilakukan skrining prakonsepsi?"),
          SizedBox(
            height: Dimension.height8,
          ),
          AppNormalButton(
              onPress: () {
                Get.toNamed(Routes.DETAIL_PRAKONSEPSI, arguments: "4");
              },
              title: "Persiapan apa saja untuk bisa hamil?"),
          SizedBox(
            height: Dimension.height18,
          ),
          RichText(
              text: TextSpan(
                  text:
                      "Dapatkan sertifikat Telah menyelesaikan kelas Prakonsepsi!",
                  style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                  children: [
                TextSpan(
                  text: " Yuk kerjakan Post Test",
                  style: TextStyles.bodySmallRegular().copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl(controller.postTestUrl);
                    },
                )
              ])),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
