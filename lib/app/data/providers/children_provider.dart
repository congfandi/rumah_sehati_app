import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/request/child_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/perkembangan.dart';

import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';

class ChildrenProvider extends ApiClient {
  final ApiResponse apiResponse;
  final Box<Child> childrenBox = Hive.box('children');

  ChildrenProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> create(
      {required ChildRequest request, String photoPath = ""}) async {
    String path = ApiUrl.children;
    apiResponse.onStartRequest(path);
    try {
      int key = childrenBox.length + 1;
      childrenBox.put(
          key,
          Child(
              id: "$key",
              fullName: request.fullName,
              gender: request.gender,
              fatherName: request.fatherName,
              motherName: request.motherName,
              birthDate: request.birthDate,
              fatherBirthday: request.fatherBirthday,
              perkembangan: [
                Perkembangan(
                  measuringDate: request.measuringDate,
                  height: request.height,
                  weight: request.weight,
                )
              ],
              motherBirthday: request.motherBirthday,
              photo: photoPath));
      apiResponse.onFinishRequest(path);
      apiResponse.onSuccessRequest(path, result, "POST");
    } on Exception catch (e) {
      apiResponse.onFailedRequest(path, 0, e.toString());
    }
  }

  Future<void> update({required Child child, String photoPath = ""}) async {
    String path = ApiUrl.updateChildren;
    apiResponse.onStartRequest(path);
    try {
      childrenBox.put(int.parse(child.id!), child);
      apiResponse.onFinishRequest(path);
      apiResponse.onSuccessRequest(path, result, "PUT");
    } on Exception catch (e) {
      apiResponse.onFailedRequest(path, 0, e.toString());
    }
  }

  Future<void> deleteChildren({required String childId}) async {
    String path = ApiUrl.children + '/$childId';
    apiResponse.onStartRequest(path);
    try {
      childrenBox.delete(childId).catchError((onError){
        debugPrint(onError.toString());
      }).then((value){
        debugPrint("deleted ");
      });
      apiResponse.onFinishRequest(path);
      apiResponse.onSuccessRequest(path, result, "PUT");
    } on Exception catch (e) {
      apiResponse.onFailedRequest(path, 0, e.toString());
    }
  }

  Future<void> getChildren() async {
    String path = ApiUrl.children;
    apiResponse.onStartRequest(path);
    apiResponse.onFinishRequest(path);
    try {
      apiResponse.onSuccessRequest(
          path, ResultResponse(children: childrenBox.values.toList()), "GET");
    } on Exception catch (e) {
      apiResponse.onFailedRequest(path, 0, e.toString());
    }
  }
}
