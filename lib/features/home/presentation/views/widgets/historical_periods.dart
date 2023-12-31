import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import 'historical_periods_item.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HistoricalPeriodItem(
          textCard: 'Ancient Egypt',
          imageFrameUrl: AppAssets.imagesFrame,
        ),
        HistoricalPeriodItem(
          textCard: 'Islamic Ara',
          imageFrameUrl: AppAssets.imagesFrame2,
        ),
      ],
    );
  }
}
