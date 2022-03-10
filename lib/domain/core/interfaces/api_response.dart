/*
 * byggtid_mobile_app
 * api_response.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */


import '../../../app/data/models/base_response.dart';

abstract class ApiResponse {
  void onFinishRequest(String path);

  void onStartRequest(String path);

  void onFailedRequest(String path, int statusCode, String message);

  void onSuccessRequest(String path, ResultResponse result);
}
