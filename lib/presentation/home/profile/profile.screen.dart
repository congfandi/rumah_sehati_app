import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../infrastructure/widgets/widgets.dart';
import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   controller.getSavedArticle();
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            const AppAppbar(
              title: Strings.profile,
              showBackButton: false,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  _header(),
                  _personalInfo(),
                  _myAccount(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        SizedBox(
          height: Dimension.height16,
        ),
        Obx(
          () => controller.isLoading.isTrue
              ? const CircleAvatar(
                  foregroundImage: NetworkImage(Strings.sampleImage),
                  radius: 45,
                )
              : CircleAvatar(
                  foregroundImage:
                      NetworkImage(controller.profile?.photo ?? ""),
                  radius: 45,
                ),
        ),
        SizedBox(
          height: Dimension.height16,
        ),
        Obx(
          () => Text(
            controller.isLoading.isTrue ? "" : controller.profile?.name ?? "",
            style: TextStyles.titleLarge(),
          ),
        ),
        SizedBox(
          height: Dimension.height8,
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget _personalInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                Strings.personalInformation,
                style: TextStyles.captionModerateSemiBold(),
              )),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit,
                      color: Pallet.primaryPurple,
                      size: 16,
                    ),
                    SizedBox(width: Dimension.width8),
                    Text(
                      Strings.edit,
                      style: TextStyles.captionModerateSemiBold(
                          color: Pallet.primaryPurple),
                    )
                  ],
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          SizedBox(height: Dimension.height16),
          Obx(
            () => Column(
                children: controller.dataProfile.entries
                    .map((rowData) => Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  rowData.key,
                                  style: TextStyles.bodySmallRegular(
                                      color: Pallet.lightBlack),
                                ),
                                Text(
                                  rowData.value,
                                  style: TextStyles.bodySmallMedium(
                                      color: Pallet.lightBlack),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            SizedBox(height: Dimension.height16)
                          ],
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget _myAccount() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(children: [
        Row(
          children: [
            Text(
              Strings.myAccount,
              style: TextStyles.captionModerateSemiBold(),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        SizedBox(height: Dimension.height16),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SAVED_ARTICLE);
          },
          child: Row(
            children: [
              Text(
                Strings.savedArticle,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
              ),
              const Expanded(child: SizedBox()),
              Obx(
                () => Text(
                  "${controller.savedArticles} Artikel",
                  style: TextStyles.bodySmallMedium(),
                ),
              ),
              SizedBox(width: Dimension.width8),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Pallet.lightBlack,
                size: 16,
              )
            ],
          ),
        ),
        //activity
        SizedBox(height: Dimension.height16),
        // Row(
        //   children: [
        //     Text(
        //       Strings.activity,
        //       style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
        //     ),
        //     const Expanded(child: SizedBox()),
        //     const Icon(
        //       Icons.arrow_forward_ios_rounded,
        //       color: Pallet.lightBlack,
        //       size: 16,
        //     )
        //   ],
        // ),
        // //change password
        // SizedBox(height: Dimension.height16),
        // Row(
        //   children: [
        //     Text(
        //       Strings.changePassword,
        //       style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
        //     ),
        //     const Expanded(child: SizedBox()),
        //     const Icon(
        //       Icons.arrow_forward_ios_rounded,
        //       color: Pallet.lightBlack,
        //       size: 16,
        //     )
        //   ],
        // ),
        //FAQ
        SizedBox(height: Dimension.height16),
        GestureDetector(
          onTap: (){
            _launchUrl("https://sehatidmf.com/public/faq");
          },
          child: Row(
            children: [
              Text(
                Strings.faq,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Pallet.lightBlack,
                size: 16,
              )
            ],
          ),
        ),
        //activity
        SizedBox(height: Dimension.height16),
        GestureDetector(
          onTap: (){
            _launchUrl("https://sehatidmf.com/public/faq");
          },
          child: Row(
            children: [
              Text(
                Strings.help,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Pallet.lightBlack,
                size: 16,
              )
            ],
          ),
        ),
        SizedBox(height: Dimension.height40),
        _buttonLogout()
      ], crossAxisAlignment: CrossAxisAlignment.start),
    );
  }

  Widget _buttonLogout() {
    return GestureDetector(
      onTap: () {
        controller.logout();
      },
      child: Container(
        width: Get.width,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Pallet.primaryPurple, width: 2)),
        child: Center(
          child: Text(
            Strings.logout,
            style: TextStyles.componentModerate(color: Pallet.primaryPurple),
          ),
        ),
      ),
    );
  }
  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
