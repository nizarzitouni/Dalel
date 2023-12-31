// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/utils.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({Key? key, required this.historicalPeriodsModel}) : super(key: key);

  final HistoricalPeriodsModel historicalPeriodsModel;

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
              historicalPeriodsModel.name,
              style: AppTextStyles.poppins500style18.copyWith(fontSize: 15, color: AppColors.deepBrown),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 64,
            width: 47,
            // decoration: BoxDecoration(
            //   image: DecorationImage(image: NetworkImage(historicalPeriodsModel.image)),
            // ),
            child: CachedNetworkImage(
              imageUrl: historicalPeriodsModel.image,
              placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: AppColors.offWhite,
                  child: Container(
                    height: 47,
                    width: 64,
                    color: AppColors.grey,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
