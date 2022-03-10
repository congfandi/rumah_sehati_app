import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/controllers/children.controller.dart';
import 'package:rumah_sehati_mobile/presentation/home/faskes/controllers/faskes.controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';
import '../../../../presentation/home/home_menu/controllers/home_menu.controller.dart';
import '../../../../presentation/home/profile/controllers/profile.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<HomeMenuController>(
      () => HomeMenuController(),
    );

    Get.lazyPut<FaskesController>(
      () => FaskesController(),
    );

    Get.lazyPut<ChildrenController>(
      () => ChildrenController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
