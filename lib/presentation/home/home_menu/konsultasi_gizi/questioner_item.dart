import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:rumah_sehati_mobile/app/data/models/consultation/consultation.dart';

import '../../../../infrastructure/theme/theme.dart';

class QuestionerItem extends StatelessWidget {
  const QuestionerItem({Key? key, required this.consultation})
      : super(key: key);
  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: Dimension.height16,
      ),
      Text(consultation.question ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.moderateSemiBold()),
      SizedBox(
        height: Dimension.height16,
      ),
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(consultation.questioner?.photo ?? ""),
          ),
          SizedBox(width: Dimension.width8),
          Text(consultation.questioner?.name ?? "",
              style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
          const Expanded(child: SizedBox()),
          Text(consultation.createdDate ?? "",
              style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      SizedBox(
        height: Dimension.height16,
      ),
      Row(
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                primary: Pallet.primaryPurple,
                backgroundColor: Pallet.primaryPurple,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.width12,
                ),
                shape: const StadiumBorder()),
            child: Text(
              consultation.category ?? "",
              style: TextStyles.captionModerateSemiBold(color: Pallet.white),
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Pallet.primaryPurple,)),
          IconButton(onPressed: (){
            _share();
          }, icon: const Icon(Icons.share_outlined,color: Pallet.primaryPurple,)),
        ],
      ),
      const Divider()
    ]);
  }

  Future<void> _share() async {
    await FlutterShare.share(
        title: 'Rumah Sehati Matindok',
        text: 'Yuk baca artikel ini',
        linkUrl: consultation.link ?? "",
        chooserTitle: 'Pilih social media');
  }
}
