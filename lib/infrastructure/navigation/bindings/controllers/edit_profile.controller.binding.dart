import 'package:get/get.dart';

import '../../../../presentation/home/profile/edit_profile/controllers/edit_profile.controller.dart';

class EditProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
