import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/perkembangan.dart';
import 'package:rumah_sehati_mobile/app/data/providers/children_provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/child.detail/chart.line.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/child.detail/child.description.dart';

class ChildDetailController extends GetxController implements ApiResponse {
  RxInt currentIndex = 0.obs;
  Child? anak;

  void onChangeIndex(int index) {
    currentIndex.value = index;
  }

  List<Widget> get child =>
      [const ChildDescription(), const LineChartSample1()];
  late final ChildrenProvider _provider = ChildrenProvider(this);

  @override
  void onInit() {
    anak = Get.arguments as Child;
    super.onInit();
  }

  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController posyanduDate = TextEditingController();
  DateTime? posyanduDateSelected;

  savePerkembangan() {
    if (height.text.isEmpty ||
        weight.text.isEmpty ||
        posyanduDateSelected == null) {
      Get.snackbar("Error", "Tidak boleh ada data yang kosong!!");
      return;
    }
    anak?.perkembangan?.add(Perkembangan(
      measuringDate:
          DateFormat("yyyy-MM-dd", "id_ID").format(posyanduDateSelected!),
      height: double.parse(height.text),
      weight: double.parse(weight.text),
    ));
    _provider.update(child: anak!);
    update(["#perkembangan"]);
    Get.back();
    height.clear();
    weight.clear();
    posyanduDate.clear();
    posyanduDateSelected = null;
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    // TODO: implement onFailedRequest
  }

  @override
  void onFinishRequest(String path) {
    // TODO: implement onFinishRequest
  }

  @override
  void onStartRequest(String path) {
    // TODO: implement onStartRequest
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    // TODO: implement onSuccessRequest
  }
}
