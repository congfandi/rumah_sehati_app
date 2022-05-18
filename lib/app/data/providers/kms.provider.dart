import 'package:hive/hive.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/kms/kms.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/domain/core/network/api_client.dart';

class KmsProvider extends ApiClient {
  final ApiResponse apiResponse;
  Box<Kms> box = Hive.box<Kms>('kms');

  KmsProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> getKms() async {
    apiResponse.onStartRequest("get");
    try {
      List<Kms> listKms = box.values.toList();
      apiResponse.onFinishRequest("get");
      apiResponse.onSuccessRequest(
          "get",
          ResultResponse(
            listKms: listKms,
          ),
          "get");
    } on Exception catch (e) {
      apiResponse.onFinishRequest("get");
      apiResponse.onFailedRequest("get", 500, e.toString());
    }
  }

  Future<void> deleteKms(int id) async {
    apiResponse.onStartRequest("delete");
    try {
      box.delete(id);
      List<Kms> listKms = box.values.toList();
      apiResponse.onFinishRequest("delete");
      apiResponse.onSuccessRequest(
          "delete",
          ResultResponse(
            listKms: listKms,
          ),
          "delete");
    } on Exception catch (e) {
      apiResponse.onFinishRequest("delete");
      apiResponse.onFailedRequest("delete", 500, e.toString());
    }
  }

  Future<void> saveKms(Kms kms) async {
    apiResponse.onStartRequest("save");
    try {
      List<Kms> listKms = box.values.toList();
      kms.id = listKms.length + 1;
      box.add(kms);
      apiResponse.onFinishRequest("save");
      apiResponse.onSuccessRequest(
          "save",
          ResultResponse(
            listKms: listKms,
          ),
          "save");
    } on Exception catch (e) {
      apiResponse.onFinishRequest("save");
      apiResponse.onFailedRequest("save", 500, e.toString());
    }
  }
}
