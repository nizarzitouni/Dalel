import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/custom_header_text.dart';
import '../custom_category_list_view.dart';

class HistoricalSovenirsSection extends StatelessWidget {
  const HistoricalSovenirsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomHeaderText(text: AppStrings.historicalSouvenirs),
        SizedBox(height: 16.0),
        CustomCategoryListView(),
      ],
    );
  }
}
