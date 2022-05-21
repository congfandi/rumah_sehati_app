import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/kms/kms.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/kms.detail/controllers/kms_detail.controller.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/views/kms.digital.result.dart';

class KmsItem extends GetView<KmsDetailController> {
  const KmsItem({Key? key, required this.kms}) : super(key: key);
  final Kms kms;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text("Jenis Kelamin"),
                flex: 1,
              ),
              Expanded(
                child: Text(kms.gender ?? ""),
                flex: 1,
              ),
              IconButton(
                  onPressed: () {
                    controller.removeKms(kms.id ?? 0);
                  }, icon: const Icon(Icons.delete_forever))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                child: Text("Usia"),
                flex: 1,
              ),
              Expanded(
                child: Text("${kms.usia ?? "0"} Bulan"),
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                child: Text("Tanggal Ukur Posyandu"),
                flex: 1,
              ),
              Expanded(
                child: Text(kms.posyanduDate ?? ""),
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                child: Text("Berat badan"),
                flex: 1,
              ),
              Expanded(
                child: Text("${kms.weight ?? ""} Kg"),
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                child: Text("ASI"),
                flex: 1,
              ),
              Expanded(
                child: Text(kms.asi ?? ""),
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            KmsDigitalResult(
                    genderController: TextEditingController(text: kms.gender),
                    dateOfBirthController:
                        TextEditingController(text: kms.birthDate),
                    posyanduDateController:
                        TextEditingController(text: kms.posyanduDate),
                    weightController:
                        TextEditingController(text: "${kms.weight}"),
                    asiController: TextEditingController(text: kms.asi),
                    needShoResult: false)
                .conclusionHistory(kms.usia ?? 0),
            style: TextStyles.moderateSemiBold(),
          )
        ],
      ),
    );
  }
}
