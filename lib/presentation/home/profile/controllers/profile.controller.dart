import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/response/article.dart';
import 'package:rumah_sehati_mobile/app/data/providers/providers.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/helpers/helpers.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../../../app/data/models/base_response.dart';
import '../../../../app/data/models/profile/response/profile.dart';
import '../../../../domain/core/interfaces/api_response.dart';
import '../../../../infrastructure/dal/services/auth_service.dart';

class ProfileController extends GetxController implements ApiResponse {
  RxMap<String, String> dataProfile = RxMap();

  late final ProfileProvider _provider = ProfileProvider(this);
  Profile? profile;
  RxBool isLoading = true.obs;
  late final Box<Article> box = Hive.box<Article>("articles");
  RxInt savedArticles = 0.obs;

  void setupProfile() {
    profile = PrefHelper.to.getProfile();
    dataProfile({
      Strings.phoneNumber:
          profile?.phone?.substring(0, 4) == "0000" ? "" : profile?.phone ?? "",
      Strings.email:
          profile?.email?.substring(0, 4) == "0000" ? "" : profile?.email ?? "",
      Strings.birthDate:
          (profile?.birthDate ?? "").toDayAndDate(format: "yyyy-MM-dd"),
      Strings.momStatus: profile?.condition ?? "",
    });
    isLoading(false);
  }

  void logout() {
    AppDialog(
        context: Get.context,
        title: "Logout",
        description: "Apa kamu yakin?",
        logo: const Icon(
          Icons.help,
          color: Pallet.danger,
          size: 30,
        ),
        onOk: () {
          AuthService.to.logout();
        },
        okTitle: "Ok",
        noTitle: "Tidak",
        onNo: () {
          Get.back();
        });
  }

  void getSavedArticle() async {
    List<Article> articles = box.values.toList();
    savedArticles(articles.length);
  }

  @override
  void onReady() {
    _provider.getProfile();
    setupProfile();
    getSavedArticle();
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {}

  @override
  void onStartRequest(String path) {
    isLoading(true);
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    PrefHelper.to.saveProfile(profile: result?.profile ?? Profile());
    setupProfile();
  }
}
