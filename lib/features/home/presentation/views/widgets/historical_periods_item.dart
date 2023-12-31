// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({Key? key, required this.imageFrameUrl, required this.textCard}) : super(key: key);
  final String textCard;
  final String imageFrameUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10,
            color: AppColors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16.0),
          SizedBox(
            height: 47,
            width: 62,
            child: Text(
              textCard,
              style: AppTextStyles.poppins500style18.copyWith(fontSize: 15, color: AppColors.deepBrown),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 64,
            width: 47,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageFrameUrl)),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
