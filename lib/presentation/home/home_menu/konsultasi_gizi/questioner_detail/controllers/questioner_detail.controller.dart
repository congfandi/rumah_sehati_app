import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/consultation/consultation.dart';

class QuestionerDetailController extends GetxController {
  Consultation? consultation;

  @override
  void onReady() {
    consultation = Get.arguments;
    super.onReady();
  }
}
